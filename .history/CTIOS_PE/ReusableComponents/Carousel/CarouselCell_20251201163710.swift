//
//  CarouselCell.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 01/12/25.
//

import UIKit

public class CarouselCell: UICollectionViewCell {

    let imgView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 18
        imgView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imgView)

        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    public func configure(with item: CarouselItem) {
        switch item {
        case .url(let urlString):
            loadImage(from: urlString)
        case .image(let img):
            imgView.image = img
        }
    }

    private func loadImage(from url: String) {
        guard let link = URL(string: url) else { return }
        URLSession.shared.dataTask(with: link) { data, _, _ in
            if let data = data, let img = UIImage(data: data) {
                DispatchQueue.main.async { self.imgView.image = img }
            }
        }.resume()
    }
}

