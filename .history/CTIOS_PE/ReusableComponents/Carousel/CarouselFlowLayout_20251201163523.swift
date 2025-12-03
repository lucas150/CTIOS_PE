//
//  CarouselFlowLayout.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 01/12/25.
//

import UIKit
import CoreFoundation

public class CarouselFlowLayout: UICollectionViewFlowLayout {

    let activeDistance: CGFloat = 200
    let zoomFactor: CGFloat = 0.25
    let sideItemAlpha: CGFloat = 0.35
    let sidePeek: CGFloat = 40

    override func prepare() {
        super.prepare()
        scrollDirection = .horizontal
        minimumLineSpacing = -sidePeek

        guard let cv = collectionView else { return }

        let width = cv.bounds.width * 0.90
        let height = cv.bounds.height * 0.85
        itemSize = CGSize(width: width, height: height)

        cv.decelerationRate = .fast
        cv.clipsToBounds = false
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    override func layoutAttributesForElements(in rect: CGRect)
        -> [UICollectionViewLayoutAttributes]? {

        guard let attrs = super.layoutAttributesForElements(in: rect),
              let cv = collectionView else { return nil }

        let center = cv.contentOffset.x + cv.bounds.width / 2

        for a in attrs {
            let distance = abs(a.center.x - center)
            let normalized = min(1, distance / activeDistance)
            let zoom = 1 - zoomFactor * normalized
            a.transform = CGAffineTransform(scaleX: zoom, y: zoom)
            a.alpha = 1 - (1 - sideItemAlpha) * normalized
        }
        return attrs
    }
}
