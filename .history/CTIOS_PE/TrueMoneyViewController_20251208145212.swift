// //
// //  TrueMoneyViewController.swift
// //  CTIOS_PE
// //
// //  Created by Pranjal Choudhary on 14/08/25.
// //

// import UIKit
// import CleverTapSDK
 
// class TrueMoneyViewController:UIViewController, UICollectionViewDelegateFlowLayout {
    
    
//     @IBOutlet weak var PayNow: UIButton!
//     private let carousel = CarouselView()
//     private var headerView: HeaderView!


//     var headerGradientView: UIView!
//     var headerGradientLayer: CAGradientLayer!
//     var cardGradientLayer: CAGradientLayer!
//     private var didLoadFromCleverTap = false



//     var bannerImageUrls: [String] = [
//     ]
//     // Icon rows
//     var firstIconRow: UIStackView!
//     var secondIconRow: UIStackView!
//     var cardContainer: UIView!

//     var carouselTimer: Timer?
//     var currentCarouselIndex = 0
//     var lastSelectedTag: Int? = nil
    
//     // Keys for UserDefaults persistence
//     private let carouselIndexKey = "TrueMoneyCarouselIndex"
//     private let selectedCategoryKey = "TrueMoneySelectedCategory"


    
//     override func viewDidLoad() {
//         super.viewDidLoad()
        
//         setupHeader()
//         setupCardUI()
//         addCardImage("card_black")
//         setupIconRowUI()
//         setupSecondIconRowUI()
//         setupCarousel()

        
//         let currentValue = UserDefaults.standard.integer(forKey: "contentCounter")
        
//         // Calculate next value (1 to 7, looping)
//         let nextValue = (currentValue % 3) + 1
        
//         // Save updated value for next time
//         UserDefaults.standard.set(nextValue, forKey: "contentCounter")
        
//         // Restore previous state
//         restoreCarouselState()
//         refreshCarousel()

//     }
    

    
//     override func viewWillDisappear(_ animated: Bool) {
//         super.viewWillDisappear(animated)
        
//         // Save current state and pause timer when leaving
//         saveCarouselState()
//         carouselTimer?.invalidate()
//         carouselTimer = nil
//     }
    
//     deinit {
//         carouselTimer?.invalidate()
//         NotificationCenter.default.removeObserver(self)
//     }
    
//     private func saveCarouselState() {
//         UserDefaults.standard.set(currentCarouselIndex, forKey: carouselIndexKey)
//         if let selectedTag = lastSelectedTag {
//             UserDefaults.standard.set(selectedTag, forKey: selectedCategoryKey)
//         }
//     }
    
//     private func restoreCarouselState() {
//         // Restore selected category
//         let savedCategory = UserDefaults.standard.integer(forKey: selectedCategoryKey)
//         if savedCategory > 0 || UserDefaults.standard.object(forKey: selectedCategoryKey) != nil {
//             lastSelectedTag = savedCategory
//             loadContentForCategory(savedCategory)
//         }
        
//         // Restore carousel position
//         currentCarouselIndex = UserDefaults.standard.integer(forKey: carouselIndexKey)
        
//         // Ensure index is valid
//         if !bannerImageUrls.isEmpty && currentCarouselIndex >= bannerImageUrls.count {
//             currentCarouselIndex = 0
//         }
//     }
    
//     private func loadContentForCategory(_ tag: Int) {
//         switch tag {
//         case 0: // Bills -> Sports
//             if let sports = CleverTap.sharedInstance()?.getVariableValue("Sports") as? [String: Any] {
//                 bannerImageUrls = [
//                     sports["Sports Banner Image 1"] as? String,
//                     sports["Sports Banner Image 2"] as? String,
//                     sports["Sports Banner Image 3"] as? String
//                 ].compactMap { $0 }
//             }
//         case 1: // Insurance -> Beauty
//             if let beauty = CleverTap.sharedInstance()?.getVariableValue("Beauty") as? [String: Any] {
//                 bannerImageUrls = [
//                     beauty["Beauty Banner Image 1"] as? String,
//                     beauty["Beauty Banner Image 2"] as? String,
//                     beauty["Beauty Banner Image 3"] as? String
//                 ].compactMap { $0 }
//             }
//         case 2: // Electricity -> Clothes
//             if let clothes = CleverTap.sharedInstance()?.getVariableValue("Clothes") as? [String: Any] {
//                 bannerImageUrls = [
//                     clothes["Clothes Banner Image 1"] as? String,
//                     clothes["Clothes Banner Image 2"] as? String,
//                     clothes["Clothes Banner Image 3"] as? String
//                 ].compactMap { $0 }
//             }
//         default:
//             break
//         }
//     }
 
    
    
    
//     func setupHeader() {
//         headerView = HeaderView()
//         headerView.translatesAutoresizingMaskIntoConstraints = false
//         headerView.titleText = "AIA"
//         headerView.logo = UIImage(named: "aia_white")

//         view.addSubview(headerView)

//         NSLayoutConstraint.activate([
//             headerView.topAnchor.constraint(equalTo: view.topAnchor),
//             headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//             headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//             headerView.heightAnchor.constraint(equalToConstant: 180)
//         ])

//         headerView.applyTheme(ThemeManager.shared.currentTheme)
//     }




    
      
//     // MARK: - Card
//     func setupCardUI() {
//         let card = UIView()
//         card.layer.cornerRadius = 20
//         card.layer.shadowOpacity = 0.15
//         card.layer.shadowRadius = 12
//         card.layer.shadowOffset = CGSize(width: 0, height: 6)
//         card.translatesAutoresizingMaskIntoConstraints = false
//         view.addSubview(card)
//         self.cardContainer = card

//         NSLayoutConstraint.activate([
//             card.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
//             card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//             card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//             card.heightAnchor.constraint(equalToConstant: 180)
//         ])

//         // ---- Gradient Background ----
//         let cardGradient = CAGradientLayer()
//         cardGradient.colors = [
//             UIColor(red: 120/255, green: 180/255, blue: 255/255, alpha: 1).cgColor,
//             UIColor(red: 80/255, green: 120/255, blue: 230/255, alpha: 1).cgColor
//         ]
//         cardGradient.cornerRadius = 20
//         cardGradient.frame = CGRect(x: 0, y: 0, width: view.frame.width - 40, height: 180)
//         card.layer.insertSublayer(cardGradient, at: 0)


//         // ---- Decorative Circles ----
//         func makeCircle(size: CGFloat, alpha: CGFloat) -> UIView {
//             let c = UIView()
//             c.backgroundColor = UIColor.white.withAlphaComponent(alpha)
//             c.layer.cornerRadius = size / 2
//             c.translatesAutoresizingMaskIntoConstraints = false
//             card.addSubview(c)
//             NSLayoutConstraint.activate([
//                 c.widthAnchor.constraint(equalToConstant: size),
//                 c.heightAnchor.constraint(equalToConstant: size)
//             ])
//             return c
//         }

//         let circle1 = makeCircle(size: 140, alpha: 0.15)
//         let circle2 = makeCircle(size: 90, alpha: 0.12)
//         let circle3 = makeCircle(size: 60, alpha: 0.10)

//         NSLayoutConstraint.activate([
//             // Large circle left
//             circle1.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: -30),
//             circle1.topAnchor.constraint(equalTo: card.topAnchor, constant: -20),

//             // Medium circle right
//             circle2.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -10),
//             circle2.topAnchor.constraint(equalTo: card.topAnchor, constant: 30),

//             // Small circle bottom-center
//             circle3.centerXAnchor.constraint(equalTo: card.centerXAnchor),
//             circle3.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -20)
//         ])
//     }

//     func addCardImage(_ imageName: String) {
//         let imgView = UIImageView()
//         imgView.image = UIImage(named: imageName)
//         imgView.contentMode = .scaleAspectFit
//         imgView.clipsToBounds = true
//         imgView.layer.cornerRadius = 20
//         imgView.translatesAutoresizingMaskIntoConstraints = false

//         cardContainer.addSubview(imgView)

//         NSLayoutConstraint.activate([
//             imgView.centerXAnchor.constraint(equalTo: cardContainer.centerXAnchor),
//               imgView.centerYAnchor.constraint(equalTo: cardContainer.centerYAnchor),
//               imgView.widthAnchor.constraint(equalTo: cardContainer.widthAnchor, multiplier: 1.2),
//               imgView.heightAnchor.constraint(equalTo: cardContainer.heightAnchor, multiplier: 1.2)
//         ])
//     }
    
    
    
   

      
//       // MARK: - FIRST Row Icons
//     func setupIconRowUI() {
//         let iconNames = ["doc.text", "shield", "bolt.fill", "creditcard"]
//         let titles = ["Bills", "Insurance", "Electricity", "Prepaid"]

//         let stack = makeIconRow(iconNames: iconNames, titles: titles, tagOffset: 0) // Tags: 0-3
        
//         view.addSubview(stack)

//         NSLayoutConstraint.activate([
//             stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 220),
//             stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//             stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//             stack.heightAnchor.constraint(equalToConstant: 100)
//         ])

//         firstIconRow = stack
//     }
      
//       // MARK: - SECOND Row Icons
//         func setupSecondIconRowUI() {
//             let iconNames = ["wallet.pass", "house.fill", "gift.fill", "phone.fill"]
//             let titles = ["Wallet", "Home", "Rewards", "Mobile"]

//             let stack = makeIconRow(iconNames: iconNames, titles: titles, tagOffset: 4) // Tags: 4-7 ⭐
            
//             view.addSubview(stack)

//             NSLayoutConstraint.activate([
//                 stack.topAnchor.constraint(equalTo: firstIconRow.bottomAnchor, constant: 20),
//                 stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//                 stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//                 stack.heightAnchor.constraint(equalToConstant: 100)
//             ])
            
//             secondIconRow = stack
//         }

//       // MARK: - Reusable Icon Creator
//     func makeIconView(icon: String, title: String, tag: Int) -> UIButton {
//         let button = UIButton(type: .system)
//         button.tag = tag
//         button.translatesAutoresizingMaskIntoConstraints = false
//         button.tintColor = .clear

//         // ---- Container Stack ----
//         let container = UIStackView()
//         container.axis = .vertical
//         container.alignment = .center
//         container.spacing = 8
//         container.translatesAutoresizingMaskIntoConstraints = false
//         container.isUserInteractionEnabled = false // ⭐ ADD THIS LINE

//         // ---- Circle BG ----
//         let bgCircle = UIView()
// //        bgCircle.backgroundColor = .white
//         bgCircle.layer.cornerRadius = 30
//         bgCircle.layer.shadowColor = UIColor.black.cgColor // Add this too
//         bgCircle.layer.shadowOpacity = 0.12
//         bgCircle.layer.shadowRadius = 6
//         bgCircle.layer.shadowOffset = CGSize(width: 0, height: 4)
//         bgCircle.translatesAutoresizingMaskIntoConstraints = false
        
//         NSLayoutConstraint.activate([
//             bgCircle.widthAnchor.constraint(equalToConstant: 60),
//             bgCircle.heightAnchor.constraint(equalToConstant: 60)
//         ])

//         // ---- Icon ----
//         let img = UIImageView(image: UIImage(systemName: icon))
//         img.tintColor = UIColor(red: 70/255, green: 120/255, blue: 255/255, alpha: 1)
//         img.contentMode = .scaleAspectFit
//         img.translatesAutoresizingMaskIntoConstraints = false

//         bgCircle.addSubview(img)
//         NSLayoutConstraint.activate([
//             img.centerXAnchor.constraint(equalTo: bgCircle.centerXAnchor),
//             img.centerYAnchor.constraint(equalTo: bgCircle.centerYAnchor),
//             img.widthAnchor.constraint(equalToConstant: 28),
//             img.heightAnchor.constraint(equalToConstant: 28)
//         ])

//         // ---- Label ----
//         let label = UILabel()
//         label.text = title
//         label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
// //        label.textColor = .darkGray
//         label.textAlignment = .center

//         // stack views
//         container.addArrangedSubview(bgCircle)
//         container.addArrangedSubview(label)

//         // assign to button
//         button.addSubview(container)
        
//         NSLayoutConstraint.activate([
//             container.topAnchor.constraint(equalTo: button.topAnchor),
//             container.bottomAnchor.constraint(equalTo: button.bottomAnchor),
//             container.leadingAnchor.constraint(equalTo: button.leadingAnchor),
//             container.trailingAnchor.constraint(equalTo: button.trailingAnchor)
//         ])

//         // Animations and tap
//         button.addTarget(self, action: #selector(animateButtonDown(_:)), for: .touchDown)
//         button.addTarget(self, action: #selector(animateButtonUp(_:)), for: [.touchUpInside, .touchUpOutside, .touchCancel])
//         button.addTarget(self, action: #selector(iconTapped(_:)), for: .touchUpInside)

//         return button
//     }
    
    
    
    
//     func setupCarousel() {
//         carousel.translatesAutoresizingMaskIntoConstraints = false
//         view.addSubview(carousel)

//         NSLayoutConstraint.activate([
//             carousel.topAnchor.constraint(equalTo: secondIconRow.safeAreaLayoutGuide.topAnchor, constant: 80),
//             carousel.leadingAnchor.constraint(equalTo: secondIconRow.leadingAnchor, constant: 20),
//             carousel.trailingAnchor.constraint(equalTo: secondIconRow.trailingAnchor, constant: -20),
//             carousel.heightAnchor.constraint(equalToConstant: 220)
//         ])

//         carousel.items = bannerImageUrls.map { .url($0) }
//         carousel.autoScrollInterval = 3
//         carousel.startAutoScroll()
//     }
    
    
    
    
//     @objc func animateButtonDown(_ sender: UIButton) {
//         UIView.animate(withDuration: 0.15) {
//             sender.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
//         }
//     }

//     @objc func animateButtonUp(_ sender: UIButton) {
//         UIView.animate(withDuration: 0.15) {
//             sender.transform = .identity
//         }
//     }
    
//     @objc func iconTapped(_ sender: UIButton) {
//         // Add haptic feedback
//         let generator = UIImpactFeedbackGenerator(style: .light)
//         generator.impactOccurred()
        
//         loadContentForCategory(sender.tag)
//         refreshCarousel()

//         lastSelectedTag = sender.tag

//         switch sender.tag {
//         // First Row
//         case 0: print("✅ Bills tapped")
//         case 1: print("✅ Insurance tapped")
//         case 2: print("✅ Electricity tapped")
//         case 3: print("✅ Prepaid tapped")
        
//         // Second Row
//         case 4: print("✅ Wallet tapped")
//         case 5: print("✅ Home tapped")
//         case 6: print("✅ Rewards tapped")
//         case 7: print("✅ Mobile tapped")
        
//         default: break
//         }
//     }
    


      
//     // MARK: - Icon Row Generator (Themed)
//     func makeIconRow(iconNames: [String], titles: [String], tagOffset: Int = 0) -> UIStackView {
//             let stack = UIStackView()
//             stack.axis = .horizontal
//             stack.distribution = .fillEqually
//             stack.alignment = .center
//             stack.spacing = 24
//             stack.translatesAutoresizingMaskIntoConstraints = false
            
//             for i in 0..<iconNames.count {
//                 stack.addArrangedSubview(makeIconView(icon: iconNames[i], title: titles[i], tag: i + tagOffset))
//             }
//             return stack
//         }



      
      
//       // MARK: - Place Pay Now Button
//       func setupPayNowConstraints() {
//           PayNow.translatesAutoresizingMaskIntoConstraints = false
          
//           NSLayoutConstraint.activate([
//               PayNow.topAnchor.constraint(equalTo: carousel.bottomAnchor, constant: 35),
//               PayNow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//               PayNow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//               PayNow.heightAnchor.constraint(equalToConstant: 55)
//           ])
//       }
// //    // Track manual scrolling to update current index
// //    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
// //        let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
// //        if pageIndex != currentCarouselIndex && pageIndex < bannerImageUrls.count {
// //            currentCarouselIndex = pageIndex
// //        }
// //    }
    
// //    // Also track programmatic scrolling
// //    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
// //        let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
// //        if pageIndex != currentCarouselIndex && pageIndex < bannerImageUrls.count {
// //            currentCarouselIndex = pageIndex
// //        }
// //    }
// //    
//     func updateIconTint(color: UIColor, textColor: UIColor? = nil) {

//         func updateRow(_ row: UIStackView) {
//             for view in row.arrangedSubviews {
//                 guard let button = view as? UIButton else { continue }

//                 // Get ALL nested image views
//                 let imageViews = button.recursiveImageViews()
//                 imageViews.forEach { $0.tintColor = color }

//                 // Get ALL nested labels
//                 let labels = button.recursiveLabels()
//                 labels.forEach { $0.textColor = textColor ?? .black }
//             }
//         }

//         updateRow(firstIconRow)
//         updateRow(secondIconRow)
//     }

//     func refreshCarousel() {
//         DispatchQueue.main.async {
//             self.carousel.stopAutoScroll()
//             self.carousel.items.removeAll()
            
//             let items = self.bannerImageUrls.map { CarouselItem.url($0) }
//             self.carousel.items = items
//             self.carousel.currentPage = min(self.currentCarouselIndex, max(self.bannerImageUrls.count - 1, 0))
            
//             self.carousel.reloadData()   // 👈 REQUIRED
//             self.carousel.startAutoScroll()
//         }
//     }



    
//     func applyHeaderGradient(topColor: UIColor, bottomColor: UIColor) {
//         guard let gradientView = view.subviews.first(where: { $0.layer.sublayers?.first is CAGradientLayer }) else { return }
        
//         if let gradientLayer = gradientView.layer.sublayers?.first as? CAGradientLayer {
//             gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
//         }
//     }
    
//     func applyCardGradient(topColor: UIColor, bottomColor: UIColor) {
//         guard let gradientLayer = cardContainer.layer.sublayers?.first as? CAGradientLayer else { return }
        
//         gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
//     }
    
// }

// extension UIView {
//     func recursiveImageViews() -> [UIImageView] {
//         var list: [UIImageView] = []

//         if let img = self as? UIImageView {
//             list.append(img)
//         }

//         for sub in subviews {
//             list.append(contentsOf: sub.recursiveImageViews())
//         }

//         return list
//     }
// }
// extension UIView {
//     func recursiveLabels() -> [UILabel] {
//         var list: [UILabel] = []

//         if let label = self as? UILabel {
//             list.append(label)
//         }

//         for sub in subviews {
//             list.append(contentsOf: sub.recursiveLabels())
//         }

//         return list
//     }
// }

// extension UIView {
//     // Returns self and all descendant subviews in a flat array
//     func recursiveViews() -> [UIView] {
//         var all: [UIView] = [self]
//         for sub in subviews {
//             all.append(contentsOf: sub.recursiveViews())
//         }
//         return all
//     }
// }

//
//  TrueMoneyViewController.swift
//  CTIOS_PE
//
//  Created by Pranjal Choudhary on 14/08/25.
//

import UIKit
import CleverTapSDK

class TrueMoneyViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - IBOutlets
    @IBOutlet weak var PayNow: UIButton!
    
    // MARK: - UI Components
    private let carousel = CarouselView()
    private var headerView: HeaderView!
    private var cardContainer: UIView!
    private var firstIconRow: UIStackView!
    private var secondIconRow: UIStackView!
    
    // MARK: - State
    private var currentCarouselIndex = 0
    private var lastSelectedTag: Int?
    private var bannerImageUrls: [String] = []
    
    private var carouselTimer: Timer?
    private var didLoadFromCleverTap = false
    
    // MARK: - Persistence Keys
    private let carouselIndexKey = "TrueMoneyCarouselIndex"
    private let selectedCategoryKey = "TrueMoneySelectedCategory"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        persistCounterState()
        restoreCarouselState()
        refreshCarousel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveCarouselState()
        carouselTimer?.invalidate()
    }
    
    deinit {
        carouselTimer?.invalidate()
        NotificationCenter.default.removeObserver(self)
    }
    
    
    // MARK: - UI Setup
    
    private func setupUI() {
        setupHeader()
        setupCard()
        addCardImage("card_black")
        setupIcons()
        setupCarousel()
    }
    
    private func setupHeader() {
        headerView = HeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.titleText = "AIA"
        headerView.logo = UIImage(named: "aia_white")
        
        view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        headerView.applyTheme(ThemeManager.shared.currentTheme)
    }
    
    private func setupCard() {
        let card = UIView()
        card.configureRoundedShadow(radius: 20, shadowOpacity: 0.15, shadowRadius: 12, shadowOffset: CGSize(width: 0, height: 6))
        
        card.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(card)
        cardContainer = card
        
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            card.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        applyCardGradient(to: card)
        addDecorativeCircles(to: card)
    }
    
    private func setupIcons() {
        firstIconRow = createIconRow(
            icons: ["doc.text", "shield", "bolt.fill", "creditcard"],
            titles: ["Bills", "Insurance", "Electricity", "Prepaid"],
            tagOffset: 0
        )
        
        secondIconRow = createIconRow(
            icons: ["wallet.pass", "house.fill", "gift.fill", "phone.fill"],
            titles: ["Wallet", "Home", "Rewards", "Mobile"],
            tagOffset: 4
        )
        
        view.addSubview(firstIconRow)
        view.addSubview(secondIconRow)
        
        NSLayoutConstraint.activate([
            firstIconRow.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 220),
            firstIconRow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstIconRow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            firstIconRow.heightAnchor.constraint(equalToConstant: 100),
            
            secondIconRow.topAnchor.constraint(equalTo: firstIconRow.bottomAnchor, constant: 20),
            secondIconRow.leadingAnchor.constraint(equalTo: firstIconRow.leadingAnchor),
            secondIconRow.trailingAnchor.constraint(equalTo: firstIconRow.trailingAnchor),
            secondIconRow.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupCarousel() {
        carousel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(carousel)
        
        NSLayoutConstraint.activate([
            carousel.topAnchor.constraint(equalTo: secondIconRow.bottomAnchor, constant: 80),
            carousel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            carousel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            carousel.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        carousel.items = bannerImageUrls.map { .url($0) }
        carousel.autoScrollInterval = 3
        carousel.startAutoScroll()
    }
    
    
    // MARK: - Carousel + Persistence
    
    private func refreshCarousel() {
        DispatchQueue.main.async {
            self.carousel.stopAutoScroll()
            self.carousel.items = self.bannerImageUrls.map { .url($0) }
            self.carousel.currentPage = min(self.currentCarouselIndex, self.bannerImageUrls.count - 1)
            self.carousel.reloadData()
            self.carousel.startAutoScroll()
        }
    }
    
    private func saveCarouselState() {
        UserDefaults.standard.set(currentCarouselIndex, forKey: carouselIndexKey)
        if let tag = lastSelectedTag { UserDefaults.standard.set(tag, forKey: selectedCategoryKey) }
    }
    
    private func restoreCarouselState() {
        lastSelectedTag = UserDefaults.standard.integer(forKey: selectedCategoryKey)
        if let tag = lastSelectedTag { loadContentForCategory(tag) }
        
        currentCarouselIndex = UserDefaults.standard.integer(forKey: carouselIndexKey)
        currentCarouselIndex = min(currentCarouselIndex, bannerImageUrls.count - 1)
    }
    
    private func persistCounterState() {
        let newValue = (UserDefaults.standard.integer(forKey: "contentCounter") % 3) + 1
        UserDefaults.standard.set(newValue, forKey: "contentCounter")
    }
    
    
    // MARK: - Icon Actions
    
    @objc private func iconTapped(_ sender: UIButton) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
        lastSelectedTag = sender.tag
        loadContentForCategory(sender.tag)
        refreshCarousel()
        
        print("🔥 Category Selected: \(sender.tag)")
    }
    
    
    // MARK: - CleverTap Category Loading
    
    private func loadContentForCategory(_ tag: Int) {
        bannerImageUrls = categoryKey(tag)?.compactMap { $0 } ?? []
    }
    
    private func categoryKey(_ tag: Int) -> [String?]? {
        let keys: [Int: String] = [0: "Sports", 1: "Beauty", 2: "Clothes"]
        guard let key = keys[tag],
              let dict = CleverTap.sharedInstance()?.getVariableValue(key) as? [String: Any] else { return nil }
        
        return ["Banner Image 1", "Banner Image 2", "Banner Image 3"].map { dict["\(key) \($0)"] as? String }
    }
    
    
    // MARK: - UI Helpers
    
    private func createIconRow(icons: [String], titles: [String], tagOffset: Int) -> UIStackView {
        let row = UIStackView(arrangedSubviews:
            zip(icons.indices, icons).map { index, icon in
                makeIconButton(iconName: icon, title: titles[index], tag: index + tagOffset)
            }
        )
        row.axis = .horizontal
        row.distribution = .fillEqually
        row.spacing = 24
        row.translatesAutoresizingMaskIntoConstraints = false
        return row
    }
    
    private func makeIconButton(iconName: String, title: String, tag: Int) -> UIButton {
        let button = UIButton(type: .system)
        button.tag = tag
        button.addTarget(self, action: #selector(iconTapped(_:)), for: .touchUpInside)
        
        button.addSubview(IconView(icon: iconName, title: title))
        return button
    }
    
    
    // MARK: - Card Visual Enhancements
    
    private func applyCardGradient(to card: UIView) {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(red: 120 / 255, green: 180 / 255, blue: 255 / 255, alpha: 1).cgColor,
            UIColor(red: 80 / 255, green: 120 / 255, blue: 230 / 255, alpha: 1).cgColor
        ]
        gradient.cornerRadius = 20
        gradient.frame = card.bounds
        card.layer.insertSublayer(gradient, at: 0)
    }
    
    private func addDecorativeCircles(to card: UIView) {
        [140, 90, 60].enumerated().forEach { index, size in
            card.addCircle(size: CGFloat(size), alpha: 0.10 + CGFloat(index) * 0.02)
        }
    }
}
