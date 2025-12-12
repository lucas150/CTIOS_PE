//
//  ViewController.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 25/07/25.
//

// TODO: - Implement CleverTap

import CleverTapSDK
import UIKit

class ViewController: UIViewController, Themeable {

    // MARK: - UI Components
    private var headerView: HeaderView!
    private let carousel = CarouselView()
    private var challengesSectionView: ThreeImageCardSectionView!
    private var categoriesSectionView: ThreeImageCardSectionView!

//    let PE_variable = CleverTap.sharedInstance()?.defineVar(
//        name: "PE_variable",
//        dictionary: [
//            "headerTitle": "Logo",
//            "logo": "aia_white",
//
//            "Icons_Images": [
//                "login": "login_icon",
//                "carInsurance": "car-inusrance",
//                "healthInsurance": "Health_Insaurance",
//                "lifeInsurance": "Life_Insauracne",
//            ],
//
//            "Challenges_Images": [
//                "run": "aia_challeng_1",
//                "yoga": "aia_challeng_2",
//                "meditate": "aia_challeng_3",
//            ],
//
//            "Dashbaord_Images": [
//                "payNow": "PayNow",
//                "bills": "doc.text",
//                "insurance": "shield",
//                "electricity": "bolt.fill",
//                "prepaid": "creditcard",
//
//                "wallet": "wallet.pass",
//                "home": "house.fill",
//                "rewards": "gift.fill",
//                "mobile": "phone.fill",
//            ],
//
//            "Cards_Image": [
//                "cardBlack": "card_black"
//            ],
//
//            "Home": [
//                "carouselTitle": "",
//                "challengesTitle": "Challenges",
//                "categoriesTitle": "Categories",
//
//                "login": "Login",
//                "dashboard": "Dashboard",
//            ],
//
//            "ChallengeItems": [
//                "run": "Run 5km",
//                "yoga": "Yoga",
//                "meditate": "Meditate",
//            ],
//
//            "CategoryItems": [
//                "carInsurance": "Car Insurance",
//                "healthInsurance": "Health Insurance",
//                "lifeInsurance": "Life Insurance",
//            ],
//
//            "Dashboard": [
//                "payNow": "Pay Now",
//
//                "bills": "Bills",
//                "insurance": "Insurance",
//                "electricity": "Electricity",
//                "prepaid": "Prepaid",
//
//                "wallet": "Wallet",
//                "home": "Home",
//                "rewards": "Rewards",
//                "mobile": "Mobile",
//            ],
//
//            "DarkTheme": [
//
//                "primary": "#FF4E4E",
//                "background": "#121212",
//                "cardBackground": "#1E1E1E",
//                "textPrimary": "#FFFFFF",
//                "textSecondary": "#B3B3B3",
//                "border": "#333333",
//
//                "headerFont": 22,
//                "headerFont_weight": "bold",
//
//                "titleFont": 18,
//                "titleFont_weight": "semibold",
//
//                "subtitleFont": 16,
//                "subtitleFont_weight": "medium",
//
//                "bodyFont": 14,
//                "bodyFont_weight": "regular",
//
//                "smallFont": 12,
//                "smallFont_weight": "regular",
//
//                "buttonFont": 16,
//                "buttonFont_weight": "semibold",
//
//            ],
//
//            "LightTheme": [
//
//                "primary": "#D8242A",
//                "background": "#F7F7F7",
//                "cardBackground": "#FFFFFF",
//                "textPrimary": "#1A1A1A",
//                "textSecondary": "#666666",
//                "border": "#E5E5E5",
//
//                "headerFont": 22,
//                "headerFont_weight": "bold",
//
//                "titleFont": 18,
//                "titleFont_weight": "semibold",
//
//                "subtitleFont": 16,
//                "subtitleFont_weight": "medium",
//
//                "bodyFont": 14,
//                "bodyFont_weight": "regular",
//
//                "smallFont": 12,
//                "smallFont_weight": "regular",
//
//                "buttonFont": 16,
//                "buttonFont_weight": "semibold",
//
//            ],
//        ]
//    )

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        applyTheme(AppTheme.shared.current)
        setupHeader()
        setupCarousel()
        setupChallengeSection()
        setupCategoriesSection()
        setupLoginButton()
        setupDashboardButton()
        
        let vars = CleverTapVariables()
        print(vars.logo ?? "No logo value")


        //        CleverTap.sharedInstance()?.syncVariables()

    }

    override func traitCollectionDidChange(
        _ previousTraitCollection: UITraitCollection?
    ) {
        super.traitCollectionDidChange(previousTraitCollection)
        applyTheme(AppTheme.shared.current)
    }

    // MARK: - THEME
    func applyTheme(_ theme: ThemeProtocol) {
        view.backgroundColor = theme.background
    }

    // MARK: - HEADER
    private func setupHeader() {
        headerView = HeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.titleText = AppStrings.headerTitle
        headerView.logo = AppImages.logo

        view.addSubview(headerView)

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
        ])
    }

    // MARK: - CAROUSEL
    private func setupCarousel() {
        carousel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(carousel)

        NSLayoutConstraint.activate([
            carousel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 10
            ),
            carousel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            carousel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),
            carousel.heightAnchor.constraint(equalToConstant: 220),
        ])

        carousel.items = [
            .url("https://picsum.photos/400/200?random=1"),
            .url("https://picsum.photos/400/200?random=2"),
            .url("https://picsum.photos/400/200?random=3"),
        ]

        carousel.startAutoScroll()
    }

    // MARK: - CHALLENGES
    private func setupChallengeSection() {
        challengesSectionView = ThreeImageCardSectionView(
            title: AppStrings.Home.challengesTitle,
            items: [
                .init(
                    imageName: "aia_challeng_1",
                    title: AppStrings.ChallengeItems.run,
                    url: nil
                ),
                .init(
                    imageName: "aia_challeng_2",
                    title: AppStrings.ChallengeItems.yoga,
                    url: nil
                ),
                .init(
                    imageName: "aia_challeng_3",
                    title: AppStrings.ChallengeItems.meditate,
                    url: nil
                ),
            ],
            onSelect: { index, item in
                print("Selected Challenge:", item.title)
            }
        )

        challengesSectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(challengesSectionView)

        NSLayoutConstraint.activate([
            challengesSectionView.topAnchor.constraint(
                equalTo: carousel.bottomAnchor,
                constant: 10
            ),
            challengesSectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            challengesSectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),
            challengesSectionView.heightAnchor.constraint(equalToConstant: 180),
        ])
    }

    // MARK: - CATEGORIES
    private func setupCategoriesSection() {
        categoriesSectionView = ThreeImageCardSectionView(
            title: AppStrings.Home.categoriesTitle,
            items: [
                .init(
                    imageName: "car-inusrance",
                    title: AppStrings.CategoryItems.carInsurance,
                    url: nil
                ),
                .init(
                    imageName: "Health_Insaurance",
                    title: AppStrings.CategoryItems.healthInsurance,
                    url: nil
                ),
                .init(
                    imageName: "Life_Insauracne",
                    title: AppStrings.CategoryItems.lifeInsurance,
                    url: nil
                ),
            ],
            onSelect: { [weak self] index, item in
                guard let self = self else { return }

                print("Selected Category:", item.title)

                switch index {
                case 0: navigateTo(loadVC(BeautyViewController.self))
                case 1: navigateTo(loadVC(SportsViewController.self))
                case 2: navigateTo(loadVC(ClothesViewController.self))
                default: break
                }
            }
        )

        categoriesSectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(categoriesSectionView)

        NSLayoutConstraint.activate([
            categoriesSectionView.topAnchor.constraint(
                equalTo: challengesSectionView.bottomAnchor,
                constant: 20
            ),
            categoriesSectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            categoriesSectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),
            categoriesSectionView.heightAnchor.constraint(equalToConstant: 180),
        ])
    }

    // MARK: - LOGIN BUTTON
    private func setupLoginButton() {
        let loginBtn = PrimaryButton(
            title: AppStrings.Home.login,
            icon: AppImages.Icons.login,
            iconPosition: .left,
            action: { [weak self] in
                guard let self = self else { return }

                print("Login tapped")

                //                           //variant A
                //                           let profile: [String: Any] = [
                //                               // Predefined profile properties
                //                               "Name": "test",
                //                               "Email": "test@gmail.com",
                //                               "Identity": 77777879,
                //                               "props":"ABTest",
                //
                //                               // Custom profile properties
                //                               "Plan type": "Silver",
                //                               "Favorite Food": "Pizza"
                //                           ]

                //variant B
                let profile: [String: Any] = [
                    // Predefined profile properties
                    "Name": "test",
                    "Email": "aditya@gmail.com",
                    "Identity": 77_777_878,
                    "props": "ABTest",

                    // Custom profile properties
                    "Plan type": "Silver",
                    "Favorite Food": "Pizza",
                ]

                CleverTap.sharedInstance()?.onUserLogin(profile)
                print("CleverTap Profile Updated:", profile)
            }
        )

        view.addSubview(loginBtn)

        NSLayoutConstraint.activate([
            loginBtn.topAnchor.constraint(
                equalTo: categoriesSectionView.bottomAnchor,
                constant: 20
            ),
            loginBtn.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            loginBtn.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),
            loginBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    // MARK: - DASHBOARD BUTTON
    private func setupDashboardButton() {
        let dashboardBtn = PrimaryButton(
            title: AppStrings.Home.dashboard,
            icon: AppImages.Icons.login,
            iconPosition: .left,
            action: { [weak self] in
                guard let self = self else { return }
                print("True Money tapped")
                navigateTo(loadVC(TrueMoneyViewController.self))
            }
        )

        view.addSubview(dashboardBtn)

        NSLayoutConstraint.activate([
            dashboardBtn.topAnchor.constraint(
                equalTo: categoriesSectionView.bottomAnchor,
                constant: 80
            ),
            dashboardBtn.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            dashboardBtn.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),
            dashboardBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
