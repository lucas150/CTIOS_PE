//
//  ViewController.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 25/07/25.
//

import UIKit
import CleverTapSDK

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var myCollectionView: UICollectionView!

    @IBOutlet weak var Login: UIButton!
    @IBOutlet weak var alertbutton: UIButton!
    @IBOutlet weak var RecommendProduct1: UIImageView!
    @IBOutlet weak var RecommendProduct2: UIImageView!
    @IBOutlet weak var RecommendProduct3: UIImageView!
    @IBOutlet weak var Challenges: UILabel!
    @IBOutlet weak var Categories: UILabel!
    @IBOutlet weak var Theme: UIButton!
    var isChristmasThemeApplied = false
    var currentThemeBackground: UIColor = .white
//    @IBOutlet weak var Carosel_bg: UIImageView! //new
    



    
    
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
        CleverTap.sharedInstance()?.recordEvent("Native Display")
        
        
        CleverTap.sharedInstance()?.syncVariables();

    }
    var carouselTimer: Timer?
    var currentCarouselIndex = 0

    
    
    
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        applyCurrentTheme()


        // Listen for theme changes
        NotificationCenter.default.addObserver(self,
                                            selector: #selector(themeDidChange),
                                            name: .themeDidChange,
                                            object: nil)
             

        
        CleverTap.sharedInstance()?.fetchVariables({ success in
              print(success)
            }
            )
        
      

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
    
    
    @IBAction func Theme(_ sender: Any) {
        ThemeManager.shared.toggleTheme()
            applyCurrentTheme()
            
            if ThemeManager.shared.isChristmasThemeApplied {
                print("🎄 Christmas Theme Applied!")
            } else {
                print("⬅️ Reverted to Default Theme")
            }
    }

    @objc func themeDidChange() {
           applyCurrentTheme()
       }
       
       func applyCurrentTheme() {
           ThemeManager.shared.applyTheme(
               to: self,
               collectionView: myCollectionView,
               themeButton: Theme,
               loginButton: Login,
               labels: [Challenges, Categories]
           )
       }
    
    





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
//            loadImage(from: beauty["Beauty Recommended Product 4"] as? String, into: RecommendProduct4)
            
            bannerImageUrls = [
                beauty["Beauty Banner Image 1"] as? String,
                beauty["Beauty Banner Image 2"] as? String,
                beauty["Beauty Banner Image 3"] as? String
            ].compactMap { $0 }
            
            print("beauty", bannerImageUrls)

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
//            loadImage(from: sports["Sports Recommended Product 4"] as? String, into: RecommendProduct4)

            bannerImageUrls = [
                sports["Sports Banner Image 1"] as? String,
                sports["Sports Banner Image 2"] as? String,
                sports["Sports Banner Image 3"] as? String
            ].compactMap { $0 }
            
            print("sports", bannerImageUrls)


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
//            loadImage(from: clothes["Clothes Recommended Product 4"] as? String, into: RecommendProduct4)
            
            bannerImageUrls = [
                clothes["Clothes Banner Image 1"] as? String,
                clothes["Clothes Banner Image 2"] as? String,
                clothes["Clothes Banner Image 3"] as? String
            ].compactMap { $0 }
            
            print("clothes", bannerImageUrls)


            myCollectionView.reloadData()
            startCarouselTimer()
            UserDefaults.standard.set("Clothes", forKey: "lastSelectedCategory")

        }
    }

}
extension UIColor {
    convenience init?(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hexString.hasPrefix("#") {
            hexString.removeFirst()
        }

        guard hexString.count == 6 else { return nil }

        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
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


extension UIButton {
    func applyPlainStyle() {
        self.configuration = nil // removes Apple's default style
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}

