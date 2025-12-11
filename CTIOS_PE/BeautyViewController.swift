//
//  BeautyViewController.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 26/07/25.
//

import UIKit
import CleverTapSDK

class BeautyViewController: UIViewController {
    
    // MARK: - UI Components
    private var headerView: HeaderView!
    private var promo: PromoCardView!
    private var insuredSection: ThreeImageCardSectionView!
    private var productsStack: UIStackView!
    
    // Dynamic images (no storyboard)
//    private var img1 = UIImageView()
//    private var img2 = UIImageView()
//    private var img3 = UIImageView()
//    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHeader()
        setupPromoCard()
        setupInsuredCarsSection()
        
        // Load CT content after layout
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.insuredSection.updateImage(at: 0, url: "https://picsum.photos/200")

//            self.loadBeautyProducts()
//            self.updateInsuredCarsImages()
        }
    }
    
    
    // MARK: - HEADER
    func setupHeader() {
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
        
//        headerView.applyTheme(ThemeManager.shared.currentTheme)
    }
    
    
    // MARK: - PROMO CARD
    func setupPromoCard() {
        promo = PromoCardView(
            title: "Upgrade Your Motor Insurance Plan",
            subtitle: "Enjoy more coverage…",
            buttonTitle: "Upgrade Now",
            backgroundColors: [UIColor.systemBlue, UIColor.blue],
            image: UIImage(named: "car_4"),
            action: { print("Promo button pressed") }
        )
        
        promo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(promo)
        
        NSLayoutConstraint.activate([
            promo.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            promo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            promo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            promo.heightAnchor.constraint(equalToConstant: 360)
        ])
    }
    
    
    // MARK: - INSURED CARS SECTION (Dynamic from CleverTap later)
    func setupInsuredCarsSection() {
        
        insuredSection = ThreeImageCardSectionView(
            title: "Your Insured Cars",
            items: [
                .init(imageName: "placeholder_car", title: "Car 1", url: nil),
                .init(imageName: "placeholder_car", title: "Car 2", url: nil),
                .init(imageName: "placeholder_car", title: "Car 3", url: nil)
            ],
            onSelect: { index, item in
                print("Selected:", item.title)
            }
        )
        
        insuredSection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(insuredSection)
        
        NSLayoutConstraint.activate([
            insuredSection.topAnchor.constraint(equalTo: promo.bottomAnchor, constant: 15),
            insuredSection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            insuredSection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            insuredSection.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    
//    // MARK: - LOAD CLEVERTAP PRODUCT GRID IMAGES
//    func loadBeautyProducts() {
//        
//        guard let beauty = CleverTap.sharedInstance()?.getVariableValue("Beauty") as? [String: Any] else {
//            print("❌ No Beauty content found in CleverTap")
//            return
//        }
//
//        loadImage(from: beauty["Beauty Product 1"] as? String, into: img1)
//        loadImage(from: beauty["Beauty Product 2"] as? String, into: img2)
//        loadImage(from: beauty["Beauty Product 3"] as? String, into: img3)
//    }
    
    
    // MARK: - UPDATE INSURED CARS SECTION IMAGES
    func updateInsuredCarsImages() {
        
        guard let beauty = CleverTap.sharedInstance()?.getVariableValue("Beauty") as? [String: Any] else { return }

        insuredSection.updateImage(at: 0, url: beauty["Beauty Product 1"] as? String)
        insuredSection.updateImage(at: 1, url: beauty["Beauty Product 2"] as? String)
        insuredSection.updateImage(at: 2, url: beauty["Beauty Product 3"] as? String)
    }
}
