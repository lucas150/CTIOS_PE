//
//  TrueMoneyViewController.swift
//  CTIOS_PE
//
//  Created by Pranjal Choudhary on 14/08/25.
//

import UIKit
import CleverTapSDK
 
class TrueMoneyViewController:UIViewController,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//    @IBOutlet weak var collectionimages: MyCollectionView!
    var bannerImageUrls: [String] = [
            "https://cdn.prod.website-files.com/5ee6fcad61bab357cf10c8fa/685387f2e3ed105bfe562c88_TrueMoneyCashInOut01.jpg",
            "https://truemoneytransfer.truemoney.com/wp-content/uploads/2023/05/truemoneytransfer-km-home-banner-4-20230530-1100x550_KH.jpeg",
            "https://pbs.twimg.com/media/EyBKk1TVEAQ9eap?format=jpg&name=4096x4096"
        ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! TrueMoneyCollectionViewCell
        
        let imageUrl = bannerImageUrls[indexPath.item]
            print(":camera_with_flash: Loading image for cell \(indexPath.item): \(imageUrl)")
        
        loadImage(from: bannerImageUrls[indexPath.item], into: cell.truemoneyImageView)
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
    
    

    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var carouselTimer: Timer?
    var currentCarouselIndex = 0

    @IBOutlet weak var TrueMoneyImageView: UIImageView!
    
    @IBOutlet weak var click1: UIButton!
    
    @IBAction func click1(_ sender: Any) {
        
        if let beauty = CleverTap.sharedInstance()?.getVariableValue("Beauty") as? [String: Any] {
            
            bannerImageUrls = [
                beauty["Beauty Banner Image 1"] as? String,
                beauty["Beauty Banner Image 2"] as? String,
                beauty["Beauty Banner Image 3"] as? String
            ].compactMap { $0 }
            
            print("beauty", bannerImageUrls)

            CollectionView.reloadData()
            startCarouselTimer()
            UserDefaults.standard.set("Beauty", forKey: "lastSelectedCategory")

        }

        
    }
    
    
    @IBOutlet weak var click2: UIButton!
    
    @IBAction func click2(_ sender: Any) {
        
        if let sports = CleverTap.sharedInstance()?.getVariableValue("Sports") as? [String: Any] {
            
            bannerImageUrls = [
                sports["Sports Banner Image 1"] as? String,
                sports["Sports Banner Image 2"] as? String,
                sports["Sports Banner Image 3"] as? String
            ].compactMap { $0 }
            
            print("sports", bannerImageUrls)

            CollectionView.reloadData()
            startCarouselTimer()
            UserDefaults.standard.set("Sports", forKey: "lastSelectedCategory")

        }

    }
    
    
    @IBOutlet weak var click3: UIButton!
    
    @IBAction func click3(_ sender: Any) {
        
        if let clothes = CleverTap.sharedInstance()?.getVariableValue("Clothes") as? [String: Any] {
            
            bannerImageUrls = [
                clothes["Clothes Banner Image 1"] as? String,
                clothes["Clothes Banner Image 2"] as? String,
                clothes["Clothes Banner Image 3"] as? String
            ].compactMap { $0 }
            
            print("clothes", bannerImageUrls)

            CollectionView.reloadData()
            startCarouselTimer()
            UserDefaults.standard.set("Clothes", forKey: "lastSelectedCategory")

        }
    }
    
    
    @IBOutlet weak var click4: UIButton!
    
    @IBAction func click4(_ sender: Any) {
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentValue = UserDefaults.standard.integer(forKey: "contentCounter")
        
        // Calculate next value (1 to 7, looping)
        let nextValue = (currentValue % 3) + 1
        
        // Save updated value for next time
        UserDefaults.standard.set(nextValue, forKey: "contentCounter")
        applyCurrentTheme()
              
              NotificationCenter.default.addObserver(self,
                                                   selector: #selector(themeDidChange),
                                                   name: .themeDidChange,
                                                   object: nil)
        
      
    }
    @objc func themeDidChange() {
         applyCurrentTheme()
     }
     
     func applyCurrentTheme() {
         ThemeManager.shared.applyTheme(
             to: self,
//             themeButton: someButton,
//             labels: [someLabel]
         )
     }
     
     deinit {
         NotificationCenter.default.removeObserver(self)
     }

}
