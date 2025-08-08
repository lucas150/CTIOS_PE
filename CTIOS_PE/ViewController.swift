//
//  ViewController.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 25/07/25.
//

import UIKit
import CleverTapSDK

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    var bannerImageUrls: [String] = [
            "https://picsum.photos/400/200?random=1",
            "https://picsum.photos/400/200?random=2",
            "https://picsum.photos/400/200?random=3"
        ]

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionView
        loadImage(from: bannerImageUrls[indexPath.item], into: cell.myImageView)
        return cell

    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myCollectionView.frame.width, height: myCollectionView.frame.height)

    }
    func startCarouselTimer() {
        carouselTimer?.invalidate()
        carouselTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
            guard self.bannerImageUrls.count > 1 else { return }
            self.currentCarouselIndex = (self.currentCarouselIndex + 1) % self.bannerImageUrls.count
            let indexPath = IndexPath(item: self.currentCarouselIndex, section: 0)
            self.myCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }


    
    
//    @IBOutlet weak var OnUserLogin: UIButton!
    @IBOutlet weak var alertbutton: UIButton!
    
    @IBOutlet weak var Login: UIButton!
    @IBAction func OnUserLogin(_ sender: Any) {
        let profile: Dictionary<String, AnyObject> = [
            //Update pre-defined profile properties
            "name": "Aditya Gandhi" as AnyObject,
            "email": "aditya@gmail.com" as AnyObject,
            "identity": 77777878 as AnyObject,
            //Update custom profile properties
            "Plan type": "Silver" as AnyObject,
            "Favorite Food": "Pizza" as AnyObject,
        ]

        CleverTap.sharedInstance()?.onUserLogin(profile)
        


//        let Beauty_Products = CleverTap.sharedInstance()?.defineVar(name: "Beauty", dictionary: [
//                "Beauty Banner Image 1": "https://media-cldnry.s-nbcnews.com/image/upload/t_social_share_1200x630_center,f_auto,q_auto:best/rockcms/2025-06/250616-beauty-awards-skincare-vl-main-7d37be.jpg",
//                "Beauty Banner Image 2": "https://media-cldnry.s-nbcnews.com/image/upload/t_social_share_1200x630_center,f_auto,q_auto:best/rockcms/2025-06/250616-beauty-awards-skincare-vl-main-7d37be.jpg",
//                "Beauty Banner Image 3": "https://media-cldnry.s-nbcnews.com/image/upload/t_social_share_1200x630_center,f_auto,q_auto:best/rockcms/2025-06/250616-beauty-awards-skincare-vl-main-7d37be.jpg",
//                
//                "Beauty Recommended Product 1": "https://media-cldnry.s-nbcnews.com/image/upload/t_social_share_1200x630_center,f_auto,q_auto:best/rockcms/2025-06/250616-beauty-awards-skincare-vl-main-7d37be.jpg",
//                "Beauty Recommended Product 2": "https://media-cldnry.s-nbcnews.com/image/upload/t_social_share_1200x630_center,f_auto,q_auto:best/rockcms/2025-06/250616-beauty-awards-skincare-vl-main-7d37be.jpg",
//                "Beauty Recommended Product 3": "https://media-cldnry.s-nbcnews.com/image/upload/t_social_share_1200x630_center,f_auto,q_auto:best/rockcms/2025-06/250616-beauty-awards-skincare-vl-main-7d37be.jpg",
//                "Beauty Recommended Product 4": "https://media-cldnry.s-nbcnews.com/image/upload/t_social_share_1200x630_center,f_auto,q_auto:best/rockcms/2025-06/250616-beauty-awards-skincare-vl-main-7d37be.jpg",
//
//                
//                "Beauty Product 1": "",
//                "Beauty Product 2": "",
//                "Beauty Product 3": "",
//                "Beauty Product 4": "",
//                "Beauty Product 5": "",
//                "Beauty Product 6": "",
//
//            ])
//        
//        
//        let Sports_Products = CleverTap.sharedInstance()?.defineVar(name: "Sports", dictionary: [
//                "Sports Banner Image 1": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Sport_balls.svg/768px-Sport_balls.svg.png",
//                "Sports Banner Image 2": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Sport_balls.svg/768px-Sport_balls.svg.png",
//                "Sports Banner Image 3": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Sport_balls.svg/768px-Sport_balls.svg.png",
//                
//                "Sports Recommended Product 1": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Sport_balls.svg/768px-Sport_balls.svg.png",
//                "Sports Recommended Product 2": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Sport_balls.svg/768px-Sport_balls.svg.png",
//                "Sports Recommended Product 3": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Sport_balls.svg/768px-Sport_balls.svg.png",
//                "Sports Recommended Product 4": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Sport_balls.svg/768px-Sport_balls.svg.png",
//
//                
//                "Sports Product 1": "",
//                "Sports Product 2": "",
//                "Sports Product 3": "",
//                "Sports Product 4": "",
//                "Sports Product 5": "",
//                "Sports Product 6": "",
//
//            ])
//        
//        let Clothes_Products = CleverTap.sharedInstance()?.defineVar(name: "Clothes", dictionary: [
//                "Clothes Banner Image 1": "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTK9M5qPZgJbVCpaNW1mcnm8XSNAZ0e5H0bxXQQko3d0fahijL41eaynuS6bBtNSJ-F45Gr-6d-gp92Z_luBsd-iiLfvVbmkO_-A1jCTNb8",
//                "Clothes Banner Image 2": "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTK9M5qPZgJbVCpaNW1mcnm8XSNAZ0e5H0bxXQQko3d0fahijL41eaynuS6bBtNSJ-F45Gr-6d-gp92Z_luBsd-iiLfvVbmkO_-A1jCTNb8",
//                "Clothes Banner Image 3": "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTK9M5qPZgJbVCpaNW1mcnm8XSNAZ0e5H0bxXQQko3d0fahijL41eaynuS6bBtNSJ-F45Gr-6d-gp92Z_luBsd-iiLfvVbmkO_-A1jCTNb8",
//                
//                "Clothes Recommended Product 1": "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTK9M5qPZgJbVCpaNW1mcnm8XSNAZ0e5H0bxXQQko3d0fahijL41eaynuS6bBtNSJ-F45Gr-6d-gp92Z_luBsd-iiLfvVbmkO_-A1jCTNb8",
//                "Clothes Recommended Product 2": "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTK9M5qPZgJbVCpaNW1mcnm8XSNAZ0e5H0bxXQQko3d0fahijL41eaynuS6bBtNSJ-F45Gr-6d-gp92Z_luBsd-iiLfvVbmkO_-A1jCTNb8",
//                "Clothes Recommended Product 3": "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTK9M5qPZgJbVCpaNW1mcnm8XSNAZ0e5H0bxXQQko3d0fahijL41eaynuS6bBtNSJ-F45Gr-6d-gp92Z_luBsd-iiLfvVbmkO_-A1jCTNb8",
//                "Clothes Recommended Product 4": "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTK9M5qPZgJbVCpaNW1mcnm8XSNAZ0e5H0bxXQQko3d0fahijL41eaynuS6bBtNSJ-F45Gr-6d-gp92Z_luBsd-iiLfvVbmkO_-A1jCTNb8",
//                
//                "Clothes Product 1": "",
//                "Clothes Product 2": "",
//                "Clothes Product 3": "",
//                "Clothes Product 4": "",
//                "Clothes Product 5": "",
//                "Clothes Product 6": "",
//
//
//            ])
//        
//        
//        
//        
//        CleverTap.sharedInstance()?.syncVariables();

    }
    var carouselTimer: Timer?
    var currentCarouselIndex = 0

    
    
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Load last selected category
        if let lastSelected = UserDefaults.standard.string(forKey: "lastSelectedCategory") {
            switch lastSelected {
            case "Beauty":
                Beauty(self)
            case "Sports":
                Sports(self)
            case "Clothes":
                Clothes(self)
            default:
                break
            }
        }
    }


//
//    @IBAction func OnUserLogin(_ sender: Any) {
//   
//    }
    



    @IBAction func Alert(_ sender: Any) {
        if let clothes = CleverTap.sharedInstance()?.getVariableValue("Clothes") as? [String: Any] {
            let jsonData = try? JSONSerialization.data(withJSONObject: clothes, options: .prettyPrinted)
            let jsonString = String(data: jsonData!, encoding: .utf8) ?? "Failed to stringify JSON"

            let alertController = UIAlertController(title: "Fetched Variable", message: jsonString, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            self.present(alertController, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Error", message: "Could not fetch variable value", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            self.present(alertController, animated: true, completion: nil)
        }

    }
    

    @IBAction func Beauty(_ sender: Any) {
        if let beauty = CleverTap.sharedInstance()?.getVariableValue("Beauty") as? [String: Any] {
            
            // Recommended Product 1 - 4
            loadImage(from: beauty["Beauty Recommended Product 1"] as? String, into: RecommendProduct1)
            loadImage(from: beauty["Beauty Recommended Product 2"] as? String, into: RecommendProduct2)
            loadImage(from: beauty["Beauty Recommended Product 3"] as? String, into: RecommendProduct3)
            loadImage(from: beauty["Beauty Recommended Product 4"] as? String, into: RecommendProduct4)
            
            bannerImageUrls = [
                beauty["Beauty Banner Image 1"] as? String,
                beauty["Beauty Banner Image 2"] as? String,
                beauty["Beauty Banner Image 3"] as? String
            ].compactMap { $0 }

            myCollectionView.reloadData()
            startCarouselTimer()
            UserDefaults.standard.set("Beauty", forKey: "lastSelectedCategory")

        }
    }

    
    @IBAction func Sports(_ sender: Any) {
        if let sports = CleverTap.sharedInstance()?.getVariableValue("Sports") as? [String: Any] {
            
            // Recommended Product 1 - 4
            loadImage(from: sports["Sports Recommended Product 1"] as? String, into: RecommendProduct1)
            loadImage(from: sports["Sports Recommended Product 2"] as? String, into: RecommendProduct2)
            loadImage(from: sports["Sports Recommended Product 3"] as? String, into: RecommendProduct3)
            loadImage(from: sports["Sports Recommended Product 4"] as? String, into: RecommendProduct4)

            bannerImageUrls = [
                sports["Sports Banner Image 1"] as? String,
                sports["Sports Banner Image 2"] as? String,
                sports["Sports Banner Image 3"] as? String
            ].compactMap { $0 }

            myCollectionView.reloadData()
            startCarouselTimer()
            UserDefaults.standard.set("Sports", forKey: "lastSelectedCategory")

        }
    }

    @IBAction func Clothes(_ sender: Any) {
        if let clothes = CleverTap.sharedInstance()?.getVariableValue("Clothes") as? [String: Any] {
            
            // Recommended Product 1 - 4
            loadImage(from: clothes["Clothes Recommended Product 1"] as? String, into: RecommendProduct1)
            loadImage(from: clothes["Clothes Recommended Product 2"] as? String, into: RecommendProduct2)
            loadImage(from: clothes["Clothes Recommended Product 3"] as? String, into: RecommendProduct3)
            loadImage(from: clothes["Clothes Recommended Product 4"] as? String, into: RecommendProduct4)
            
            bannerImageUrls = [
                clothes["Clothes Banner Image 1"] as? String,
                clothes["Clothes Banner Image 2"] as? String,
                clothes["Clothes Banner Image 3"] as? String
            ].compactMap { $0 }

            myCollectionView.reloadData()
            startCarouselTimer()
            UserDefaults.standard.set("Clothes", forKey: "lastSelectedCategory")

        }
    }

    @IBOutlet weak var RecommendProduct1: UIImageView!
    
    @IBOutlet weak var RecommendProduct2: UIImageView!
    
    @IBOutlet weak var RecommendProduct3: UIImageView!
    
    @IBOutlet weak var RecommendProduct4: UIImageView!
    
}



func loadImage(from urlString: String?, into imageView: UIImageView) {
    guard let urlString = urlString, let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data, let image = UIImage(data: data) {
            DispatchQueue.main.async {
                imageView.image = image
            }
        } else {
            print("Failed to load image from URL: \(url)")
        }
    }.resume()
}
