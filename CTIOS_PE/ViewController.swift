//
//  ViewController.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 25/07/25.
//

import UIKit
import CleverTapSDK

class ViewController: UIViewController {

    // MARK: - Reusable Components
    private var headerView: HeaderView!
    private let carousel = CarouselView()
    private var challengesSectionView: ThreeImageCardSectionView!
    private var categoriesSectionView: ThreeImageCardSectionView!
    let beautyViewController = UIStoryboard(name: "Main", bundle: nil)
        .instantiateViewController(withIdentifier: "BeautyViewController") as! BeautyViewController


    // MARK: - Carousel Data
    var bannerImageUrls: [String] = [
        "https://picsum.photos/400/200?random=1",
        "https://picsum.photos/400/200?random=2",
        "https://picsum.photos/400/200?random=3"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        setupHeader()
        setupCarousel()
        setupChallengeSection()
        setupCategoriesSection()
        setupLoginButton()
        
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

        headerView.applyTheme(ThemeManager.shared.currentTheme)
    }

    // MARK: - CAROUSEL
    func setupCarousel() {
        carousel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(carousel)

        NSLayoutConstraint.activate([
            carousel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            carousel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            carousel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            carousel.heightAnchor.constraint(equalToConstant: 220)
        ])

        carousel.items = bannerImageUrls.map { .url($0) }
        carousel.autoScrollInterval = 3
        carousel.startAutoScroll()
    }

    // MARK: - CHALLENGES SECTION
    func setupChallengeSection() {
        challengesSectionView = ThreeImageCardSectionView(
            title: "Challenges",
            items: [
                .init(imageName: "aia_challeng_1", title: "Run 5km", url: nil),
                .init(imageName: "aia_challeng_2", title: "Yoga", url: nil),
                .init(imageName: "aia_challeng_3", title: "Meditate", url: nil)
            ],
            onSelect: { index, item in
                print("Selected Challenge:", item.title)
            }
        )

        challengesSectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(challengesSectionView)

        NSLayoutConstraint.activate([
            challengesSectionView.topAnchor.constraint(equalTo: carousel.bottomAnchor, constant: 20),
            challengesSectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            challengesSectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            challengesSectionView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }

    // MARK: - CATEGORIES SECTION
    func setupCategoriesSection() {
        categoriesSectionView = ThreeImageCardSectionView(
            title: "Categories",
            items: [
                .init(imageName: "car-inusrance", title: "Car Insurance", url: nil),
                .init(imageName: "Health_Insaurance", title: "Health Insurance", url: nil),
                .init(imageName: "Life_Insauracne", title: "Life Insurance", url: nil)
            ],
            onSelect: { [weak self] index, item in
                guard let self = self else { return }

                print("Selected Category:", item.title)

                switch index {
                case 0:
                    navigateTo(loadVC(TrueMoneyViewController.self))
                case 1:
                    navigateTo(loadVC(SportsViewController.self))
                case 2:
                    navigateTo(loadVC(ClothesViewController.self))
                default:
                    break
                }
            }
        )

        categoriesSectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(categoriesSectionView)

        NSLayoutConstraint.activate([
            categoriesSectionView.topAnchor.constraint(equalTo: challengesSectionView.bottomAnchor, constant: 20),
            categoriesSectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            categoriesSectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            categoriesSectionView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }


    // MARK: - LOGIN BUTTON
    func setupLoginButton() {
        let loginBtn = PrimaryButton(
            title: "Login",
            icon: UIImage(named: "login_icon"),
            iconPosition: .left,
            backgroundColor: .systemBlue,
            textColor: .white,
            action: {
                print("Login tapped")
            }
        )

        view.addSubview(loginBtn)

        NSLayoutConstraint.activate([
            loginBtn.topAnchor.constraint(equalTo: categoriesSectionView.bottomAnchor, constant: 20),
            loginBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
