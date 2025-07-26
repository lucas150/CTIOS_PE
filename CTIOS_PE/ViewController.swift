////
////  ViewController.swift
////  CTIOS_PE
////
////  Created by Henil Gandhi on 25/07/25.
////
//
//import UIKit
//import CleverTapSDK
//class ViewController: UIViewController {
//
////class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
////    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        return bannerImageUrls.count
////        
////    }
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////          let width = collectionView.frame.width
////          let height = width * 9 / 16 // 16:9 aspect ratio
////          return CGSize(width: width, height: height)
////      }
////
////    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.identifier, for: indexPath) as! CarouselCell
////        loadImage(from: bannerImageUrls[indexPath.item], into: cell.imageView)
////        print("loadImage called with urlString:", bannerImageUrls[indexPath.item] ?? "nil")
////
////        return cell
////
////    }
////    func startCarouselTimer() {
////        carouselTimer?.invalidate()
////        carouselTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
////            guard self.bannerImageUrls.count > 1 else { return }
////            self.currentCarouselIndex = (self.currentCarouselIndex + 1) % self.bannerImageUrls.count
////            let indexPath = IndexPath(item: self.currentCarouselIndex, section: 0)
////            self.CarouselImage.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
////        }
////    }
//
//
//    
//    
//    @IBOutlet weak var OnUserLogin: UIButton!
//    @IBOutlet weak var alertbutton: UIButton!
//    @IBOutlet weak var CollectionViewCarousel: UICollectionView!
//    @IBOutlet weak var RecommendProduct1: UIImageView!
//    
//    @IBOutlet weak var RecommendProduct2: UIImageView!
//    
//    @IBOutlet weak var RecommendProduct3: UIImageView!
//    
//    @IBOutlet weak var RecommendProduct4: UIImageView!
//    
////    @IBOutlet weak var CarouselImage: UICollectionView!
//    
////    @IBOutlet weak var CarouselCell: CarouselCell!
//    @IBOutlet weak var CarouselImage: UICollectionView!
//    
//    
//    var bannerImageUrls: [String] = ["img1","img2","img3"]
//    var carouselTimer: Timer?
//    var currentCarouselIndex = 0
//
//    
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        timer = Timer(timeInterval: 2.0, target: Self, selector: #selector(slideToNext), userInfo: nil, repeats:true)
////        CarouselImage.delegate = self
////        CarouselImage.dataSource = self
////
////        
////        // Set scroll direction
////        if let layout = CarouselImage.collectionViewLayout as? UICollectionViewFlowLayout {
////            layout.scrollDirection = .horizontal
////            layout.minimumLineSpacing = 0
////        }
////        CarouselImage.isPagingEnabled = true
////        CarouselImage.register(CarouselCell.self, forCellWithReuseIdentifier: "CarouselCell")
//
//    }
//    
//    @objc func slideToNext(){
//        if currentCarouselIndex < bannerImageUrls.count -1{
//            currentCarouselIndex = currentCarouselIndex +1
//        }else
//        {
//            currentCarouselIndex = 0
//        }
//        
//        CollectionViewCarousel.scrollToItem(at: IndexPath(item: currentCarouselIndex, section: 0), at: .right, animated: true)
//        
//    }
//
//    @IBAction func OnUserLogin(_ sender: Any) {
//   
//        let profile: Dictionary<String, AnyObject> = [
//            //Update pre-defined profile properties
//            "name": "Aditya Gandhi" as AnyObject,
//            "email": "aditya@gmail.com" as AnyObject,
//            "identity": 77777878 as AnyObject,
//            //Update custom profile properties
//            "Plan type": "Silver" as AnyObject,
//            "Favorite Food": "Pizza" as AnyObject,
//        ]
//
//        CleverTap.sharedInstance()?.onUserLogin(profile)
//        
//    
//        let var_string = CleverTap.sharedInstance()?.defineVar(name: "var_string", string: "hello, world")
//        let var_int = CleverTap.sharedInstance()?.defineVar(name: "var_int", integer: 10)
//        let var_bool = CleverTap.sharedInstance()?.defineVar(name: "var_bool", boolean: true)
//        let var_float = CleverTap.sharedInstance()?.defineVar(name: "var_float", float: 6.0)
//        let var_double = CleverTap.sharedInstance()?.defineVar(name: "var_double", double: 60.999)
//        let var_short = CleverTap.sharedInstance()?.defineVar(name: "var_short", short: 1)
//        let var_number = CleverTap.sharedInstance()?.defineVar(name: "var_number", number: NSNumber(value: 32))
//        let var_long = CleverTap.sharedInstance()?.defineVar(name: "var_long", long: 64)
//        // Dictionary
//        let var_dict = CleverTap.sharedInstance()?.defineVar(name: "var_dict", dictionary: [
//              "nested_string": "hello, nested",
//              "nested_double": 10.5
//            ])
//
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
//    }
//    
//
//
//
//    @IBAction func Alert(_ sender: Any) {
//        if let clothes = CleverTap.sharedInstance()?.getVariableValue("Clothes") as? [String: Any] {
//            let jsonData = try? JSONSerialization.data(withJSONObject: clothes, options: .prettyPrinted)
//            let jsonString = String(data: jsonData!, encoding: .utf8) ?? "Failed to stringify JSON"
//
//            let alertController = UIAlertController(title: "Fetched Variable", message: jsonString, preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//
//            self.present(alertController, animated: true, completion: nil)
//        } else {
//            let alertController = UIAlertController(title: "Error", message: "Could not fetch variable value", preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//
//            self.present(alertController, animated: true, completion: nil)
//        }
//
//    }
//    
//
//    @IBAction func Beauty(_ sender: Any) {
//        if let beauty = CleverTap.sharedInstance()?.getVariableValue("Beauty") as? [String: Any] {
//            
//            // Recommended Product 1 - 4
//            loadImage(from: beauty["Beauty Recommended Product 1"] as? String, into: RecommendProduct1)
//            loadImage(from: beauty["Beauty Recommended Product 2"] as? String, into: RecommendProduct2)
//            loadImage(from: beauty["Beauty Recommended Product 3"] as? String, into: RecommendProduct3)
//            loadImage(from: beauty["Beauty Recommended Product 4"] as? String, into: RecommendProduct4)
//            
//            // Carousel: Combine 3 images into a slide show (optional) or just set 1 image now:
////            bannerImageUrls = [
////                beauty["Beauty Banner Image 1"] as? String,
////                beauty["Beauty Banner Image 2"] as? String,
////                beauty["Beauty Banner Image 3"] as? String
////            ].compactMap { $0 }
////
////            CarouselImage.reloadData()
////            startCarouselTimer()
//        }
//    }
//
//    
//    @IBAction func Sports(_ sender: Any) {
//        if let beauty = CleverTap.sharedInstance()?.getVariableValue("Sports") as? [String: Any] {
//            
//            // Recommended Product 1 - 4
//            loadImage(from: beauty["Sports Recommended Product 1"] as? String, into: RecommendProduct1)
//            loadImage(from: beauty["Sports Recommended Product 2"] as? String, into: RecommendProduct2)
//            loadImage(from: beauty["Sports Recommended Product 3"] as? String, into: RecommendProduct3)
//            loadImage(from: beauty["Sports Recommended Product 4"] as? String, into: RecommendProduct4)
//            
////            bannerImageUrls = [
////                beauty["Sports Banner Image 1"] as? String,
////                beauty["Sports Banner Image 2"] as? String,
////                beauty["Sports Banner Image 3"] as? String
////            ].compactMap { $0 }
////
////            CarouselImage.reloadData()
////            startCarouselTimer()
//        }
//    }
//
//    @IBAction func Clothes(_ sender: Any) {
//        if let beauty = CleverTap.sharedInstance()?.getVariableValue("Clothes") as? [String: Any] {
//            
//            // Recommended Product 1 - 4
//            loadImage(from: beauty["Clothes Recommended Product 1"] as? String, into: RecommendProduct1)
//            loadImage(from: beauty["Clothes Recommended Product 2"] as? String, into: RecommendProduct2)
//            loadImage(from: beauty["Clothes Recommended Product 3"] as? String, into: RecommendProduct3)
//            loadImage(from: beauty["Clothes Recommended Product 4"] as? String, into: RecommendProduct4)
//            
////            bannerImageUrls = [
////                beauty["Clothes Banner Image 1"] as? String,
////                beauty["Clothes Banner Image 2"] as? String,
////                beauty["Clothes Banner Image 3"] as? String
////            ].compactMap { $0 }
////
////            CarouselImage.reloadData()
////            startCarouselTimer()
//        }
//    }
//
//
//}
//
//
//
//func loadImage(from urlString: String?, into imageView: UIImageView) {
//    guard let urlString = urlString, let url = URL(string: urlString) else { return }
//    
//    URLSession.shared.dataTask(with: url) { data, response, error in
//        if let data = data, let image = UIImage(data: data) {
//            DispatchQueue.main.async {
//                imageView.image = image
//            }
//        } else {
//            print("Failed to load image from URL: \(url)")
//        }
//    }.resume()
//}
//
//
//extension ViewController : UICollectionViewDelegate,UICollectionViewFlowLayout,UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return bannerImageUrls.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = CollectionViewCarousel.dequeueReusableCell(withReuseIdentifier: "cell", for: IndexPath) as! MyCollectionView
//        cell.ImageView.image = UIImage(named: bannerImageUrls[indexPath.row])
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////          let width = collectionView.frame.width
////          let height = width * 9 / 16 // 16:9 aspect ratio
//        return CGSize(width: CollectionViewCarousel.frame.width, height: CollectionViewCarousel.frame.height)
//      }
//
//    
//}





import UIKit
import CleverTapSDK

class ViewController: UIViewController {

    @IBOutlet weak var OnUserLogin: UIButton!
    @IBOutlet weak var alertbutton: UIButton!
    @IBOutlet weak var CollectionViewCarousel: UICollectionView!
    @IBOutlet weak var RecommendProduct1: UIImageView!
    @IBOutlet weak var RecommendProduct2: UIImageView!
    @IBOutlet weak var RecommendProduct3: UIImageView!
    @IBOutlet weak var RecommendProduct4: UIImageView!
//    @IBOutlet weak var CarouselImage: UICollectionView!

    var bannerImageUrls: [String] = [
        "img1",
        "img2",
        "img3"
    ]
    
    var carouselTimer: Timer?
    var currentCarouselIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectionViewCarousel.delegate = self
        CollectionViewCarousel.dataSource = self
        
        if let layout = CollectionViewCarousel.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
        }
        
        CollectionViewCarousel.isPagingEnabled = true
        CollectionViewCarousel.register(MyCollectionView.self, forCellWithReuseIdentifier: "cell")
//
        // Start automatic slide
        carouselTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
    }

    @objc func slideToNext() {
        if currentCarouselIndex < bannerImageUrls.count - 1 {
            currentCarouselIndex += 1
        } else {
            currentCarouselIndex = 0
        }
        let indexPath = IndexPath(item: currentCarouselIndex, section: 0)
        CollectionViewCarousel.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }


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
        
    
        let var_string = CleverTap.sharedInstance()?.defineVar(name: "var_string", string: "hello, world")
        let var_int = CleverTap.sharedInstance()?.defineVar(name: "var_int", integer: 10)
        let var_bool = CleverTap.sharedInstance()?.defineVar(name: "var_bool", boolean: true)
        let var_float = CleverTap.sharedInstance()?.defineVar(name: "var_float", float: 6.0)
        let var_double = CleverTap.sharedInstance()?.defineVar(name: "var_double", double: 60.999)
        let var_short = CleverTap.sharedInstance()?.defineVar(name: "var_short", short: 1)
        let var_number = CleverTap.sharedInstance()?.defineVar(name: "var_number", number: NSNumber(value: 32))
        let var_long = CleverTap.sharedInstance()?.defineVar(name: "var_long", long: 64)
        // Dictionary
        let var_dict = CleverTap.sharedInstance()?.defineVar(name: "var_dict", dictionary: [
              "nested_string": "hello, nested",
              "nested_double": 10.5
            ])

        let Beauty_Products = CleverTap.sharedInstance()?.defineVar(name: "Beauty", dictionary: [
                "Beauty Banner Image 1": "https://media-cldnry.s-nbcnews.com/image/upload/t_social_share_1200x630_center,f_auto,q_auto:best/rockcms/2025-06/250616-beauty-awards-skincare-vl-main-7d37be.jpg",
                "Beauty Banner Image 2": "https://media-cldnry.s-nbcnews.com/image/upload/t_social_share_1200x630_center,f_auto,q_auto:best/rockcms/2025-06/250616-beauty-awards-skincare-vl-main-7d37be.jpg",
                "Beauty Banner Image 3": "https://media-cldnry.s-nbcnews.com/image/upload/t_social_share_1200x630_center,f_auto,q_auto:best/rockcms/2025-06/250616-beauty-awards-skincare-vl-main-7d37be.jpg",
                
                "Beauty Recommended Product 1": "https://media-cldnry.s-nbcnews.com/image/upload/t_social_share_1200x630_center,f_auto,q_auto:best/rockcms/2025-06/250616-beauty-awards-skincare-vl-main-7d37be.jpg",
                "Beauty Recommended Product 2": "https://media-cldnry.s-nbcnews.com/image/upload/t_social_share_1200x630_center,f_auto,q_auto:best/rockcms/2025-06/250616-beauty-awards-skincare-vl-main-7d37be.jpg",
                "Beauty Recommended Product 3": "https://media-cldnry.s-nbcnews.com/image/upload/t_social_share_1200x630_center,f_auto,q_auto:best/rockcms/2025-06/250616-beauty-awards-skincare-vl-main-7d37be.jpg",
                "Beauty Recommended Product 4": "https://media-cldnry.s-nbcnews.com/image/upload/t_social_share_1200x630_center,f_auto,q_auto:best/rockcms/2025-06/250616-beauty-awards-skincare-vl-main-7d37be.jpg",

                
                "Beauty Product 1": "",
                "Beauty Product 2": "",
                "Beauty Product 3": "",
                "Beauty Product 4": "",
                "Beauty Product 5": "",
                "Beauty Product 6": "",

            ])
        
        
        let Sports_Products = CleverTap.sharedInstance()?.defineVar(name: "Sports", dictionary: [
                "Sports Banner Image 1": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Sport_balls.svg/768px-Sport_balls.svg.png",
                "Sports Banner Image 2": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Sport_balls.svg/768px-Sport_balls.svg.png",
                "Sports Banner Image 3": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Sport_balls.svg/768px-Sport_balls.svg.png",
                
                "Sports Recommended Product 1": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Sport_balls.svg/768px-Sport_balls.svg.png",
                "Sports Recommended Product 2": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Sport_balls.svg/768px-Sport_balls.svg.png",
                "Sports Recommended Product 3": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Sport_balls.svg/768px-Sport_balls.svg.png",
                "Sports Recommended Product 4": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Sport_balls.svg/768px-Sport_balls.svg.png",

                
                "Sports Product 1": "",
                "Sports Product 2": "",
                "Sports Product 3": "",
                "Sports Product 4": "",
                "Sports Product 5": "",
                "Sports Product 6": "",

            ])
        
        let Clothes_Products = CleverTap.sharedInstance()?.defineVar(name: "Clothes", dictionary: [
                "Clothes Banner Image 1": "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTK9M5qPZgJbVCpaNW1mcnm8XSNAZ0e5H0bxXQQko3d0fahijL41eaynuS6bBtNSJ-F45Gr-6d-gp92Z_luBsd-iiLfvVbmkO_-A1jCTNb8",
                "Clothes Banner Image 2": "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTK9M5qPZgJbVCpaNW1mcnm8XSNAZ0e5H0bxXQQko3d0fahijL41eaynuS6bBtNSJ-F45Gr-6d-gp92Z_luBsd-iiLfvVbmkO_-A1jCTNb8",
                "Clothes Banner Image 3": "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTK9M5qPZgJbVCpaNW1mcnm8XSNAZ0e5H0bxXQQko3d0fahijL41eaynuS6bBtNSJ-F45Gr-6d-gp92Z_luBsd-iiLfvVbmkO_-A1jCTNb8",
                
                "Clothes Recommended Product 1": "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTK9M5qPZgJbVCpaNW1mcnm8XSNAZ0e5H0bxXQQko3d0fahijL41eaynuS6bBtNSJ-F45Gr-6d-gp92Z_luBsd-iiLfvVbmkO_-A1jCTNb8",
                "Clothes Recommended Product 2": "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTK9M5qPZgJbVCpaNW1mcnm8XSNAZ0e5H0bxXQQko3d0fahijL41eaynuS6bBtNSJ-F45Gr-6d-gp92Z_luBsd-iiLfvVbmkO_-A1jCTNb8",
                "Clothes Recommended Product 3": "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTK9M5qPZgJbVCpaNW1mcnm8XSNAZ0e5H0bxXQQko3d0fahijL41eaynuS6bBtNSJ-F45Gr-6d-gp92Z_luBsd-iiLfvVbmkO_-A1jCTNb8",
                "Clothes Recommended Product 4": "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTK9M5qPZgJbVCpaNW1mcnm8XSNAZ0e5H0bxXQQko3d0fahijL41eaynuS6bBtNSJ-F45Gr-6d-gp92Z_luBsd-iiLfvVbmkO_-A1jCTNb8",
                
                "Clothes Product 1": "",
                "Clothes Product 2": "",
                "Clothes Product 3": "",
                "Clothes Product 4": "",
                "Clothes Product 5": "",
                "Clothes Product 6": "",


            ])
        
        
        
        
        CleverTap.sharedInstance()?.syncVariables();
    }
    
    @IBAction func Alert(_ sender: Any) {
          if let clothes = CleverTap.sharedInstance()?.getVariableValue("Clothes") as? [String: Any],
             let jsonData = try? JSONSerialization.data(withJSONObject: clothes, options: .prettyPrinted),
             let jsonString = String(data: jsonData, encoding: .utf8) {
              showAlert(title: "Fetched Variable", message: jsonString)
          } else {
              showAlert(title: "Error", message: "Could not fetch variable value")
          }
      }

      @IBAction func Beauty(_ sender: Any) {
          if let beauty = CleverTap.sharedInstance()?.getVariableValue("Beauty") as? [String: Any] {
              loadImage(from: beauty["Beauty Recommended Product 1"] as? String, into: RecommendProduct1)
              loadImage(from: beauty["Beauty Recommended Product 2"] as? String, into: RecommendProduct2)
              loadImage(from: beauty["Beauty Recommended Product 3"] as? String, into: RecommendProduct3)
              loadImage(from: beauty["Beauty Recommended Product 4"] as? String, into: RecommendProduct4)

              bannerImageUrls = [
                  beauty["Beauty Banner Image 1"] as? String,
                  beauty["Beauty Banner Image 2"] as? String,
                  beauty["Beauty Banner Image 3"] as? String
              ].compactMap { $0 }

              CollectionViewCarousel.reloadData()
              currentCarouselIndex = 0
          }
      }

      @IBAction func Sports(_ sender: Any) {
          if let sports = CleverTap.sharedInstance()?.getVariableValue("Sports") as? [String: Any] {
              loadImage(from: sports["Sports Recommended Product 1"] as? String, into: RecommendProduct1)
              loadImage(from: sports["Sports Recommended Product 2"] as? String, into: RecommendProduct2)
              loadImage(from: sports["Sports Recommended Product 3"] as? String, into: RecommendProduct3)
              loadImage(from: sports["Sports Recommended Product 4"] as? String, into: RecommendProduct4)

              bannerImageUrls = [
                  sports["Sports Banner Image 1"] as? String,
                  sports["Sports Banner Image 2"] as? String,
                  sports["Sports Banner Image 3"] as? String
              ].compactMap { $0 }

              CollectionViewCarousel.reloadData()
              currentCarouselIndex = 0
          }
      }

      @IBAction func Clothes(_ sender: Any) {
          if let clothes = CleverTap.sharedInstance()?.getVariableValue("Clothes") as? [String: Any] {
              loadImage(from: clothes["Clothes Recommended Product 1"] as? String, into: RecommendProduct1)
              loadImage(from: clothes["Clothes Recommended Product 2"] as? String, into: RecommendProduct2)
              loadImage(from: clothes["Clothes Recommended Product 3"] as? String, into: RecommendProduct3)
              loadImage(from: clothes["Clothes Recommended Product 4"] as? String, into: RecommendProduct4)

              bannerImageUrls = [
                  clothes["Clothes Banner Image 1"] as? String,
                  clothes["Clothes Banner Image 2"] as? String,
                  clothes["Clothes Banner Image 3"] as? String
              ].compactMap { $0 }

              CollectionViewCarousel.reloadData()
              currentCarouselIndex = 0
          }
      }

      func showAlert(title: String, message: String) {
          let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
          alertController.addAction(UIAlertAction(title: "OK", style: .default))
          present(alertController, animated: true)
      }
  }

  // MARK: - Image Download Helper
  func loadImage(from urlString: String?, into imageView: UIImageView) {
      guard let urlString = urlString, let url = URL(string: urlString) else { return }

      URLSession.shared.dataTask(with: url) { data, _, _ in
          if let data = data, let image = UIImage(data: data) {
              DispatchQueue.main.async {
                  imageView.image = image
              }
          }
      }.resume()
  }

  // MARK: - CollectionView Delegates
  extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return bannerImageUrls.count
      }

      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = CollectionViewCarousel.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionView
          let imageUrl = bannerImageUrls[indexPath.row]
          loadImage(from: imageUrl, into: cell.ImageView)
          return cell
      }

      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
      }
  }
