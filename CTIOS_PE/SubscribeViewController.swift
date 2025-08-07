//
//  SubscribeViewController.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 07/08/25.
//

import UIKit
import CleverTapSDK

class SubscribeViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,CleverTapDisplayUnitDelegate {
    
    
    var bannerImageUrls: [String] = [
//            "https://picsum.photos/400/200?random=1",
//            "https://picsum.photos/400/200?random=2",
//            "https://picsum.photos/400/200?random=3"
        ]

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! SubscribeCollectionViewCell
        loadImage(from: bannerImageUrls[indexPath.item], into: cell.MyImageView2)
        return cell

    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CollectionView.frame.width, height: CollectionView.frame.height)

    }
    func startCarouselTimer() {
        carouselTimer?.invalidate()
        carouselTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
            guard self.bannerImageUrls.count > 1 else { return }
            self.currentCarouselIndex = (self.currentCarouselIndex + 1) % self.bannerImageUrls.count
            let indexPath = IndexPath(item: self.currentCarouselIndex, section: 0)
            self.CollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentValue = UserDefaults.standard.integer(forKey: "contentCounter")
        
        // Calculate next value (1 to 7, looping)
        let nextValue = (currentValue % 3) + 1
        
        // Save updated value for next time
        UserDefaults.standard.set(nextValue, forKey: "contentCounter")
        
        // Send event to CleverTap
        let props = [
            "Content": nextValue
        ] as [String : Any]

        CleverTap.sharedInstance()?.recordEvent("Native Display", withProps: props)
        CleverTap.sharedInstance()?.setDisplayUnitDelegate(self)


    }

//    func displayUnitsUpdated(_ displayUnits: [CleverTapDisplayUnit]) {
//        print("Display Units received:", displayUnits)
//        
//
//
//        // If display units are empty, do nothing (keep existing URLs)
//        guard !displayUnits.isEmpty else {
//            print("No display units received, keeping default images.")
//            return
//        }
//
//        // Replace with images from CleverTap
//        bannerImageUrls.removeAll()
//
//        for unit in displayUnits {
//            if let contents = unit.contents {
//                for content in contents {
//
//                    print("👉 Title: \(content.title ?? "nil")")
//                    print("👉 Media URL: \(content.mediaUrl ?? "nil")")
//
//                    if let imageUrl = content.mediaUrl {
//                        bannerImageUrls.append(imageUrl)
//                    }
//                    print("imageurl", bannerImageUrls )
//
//                }
//            } else {
//                print("❌ No contents in display unit.")
//            }
//        }
//
//
//        DispatchQueue.main.async {
//            self.currentCarouselIndex = 0
//            self.CollectionView.reloadData()
//            self.startCarouselTimer()
//        }
//    }
    func displayUnitsUpdated(_ displayUnits: [CleverTapDisplayUnit]) {
        print("✅ Display Units received: \(displayUnits)")

        // Clear existing URLs
        bannerImageUrls.removeAll()

        for unit in displayUnits {
            if let extras = unit.customExtras as? [String: Any] {
                for (key, value) in extras {
                    if key.lowercased().contains("image"), let url = value as? String {
                        print("🖼️ Found image: \(url)")
                        bannerImageUrls.append(url)
                    }
                }
            } else {
                print("❌ No customExtras found in display unit.")
            }
        }

        DispatchQueue.main.async {
            self.currentCarouselIndex = 0
            self.CollectionView.reloadData()
            self.startCarouselTimer()
        }
    }



    @IBOutlet weak var CollectionView: UICollectionView!
    
//    @IBOutlet weak var MyCollectionView: UICollectionView!
    var carouselTimer: Timer?
    var currentCarouselIndex = 0


}
