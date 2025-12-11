//
//  ViewController.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 25/07/25.
//


// TODO: - Implement CleverTap



import UIKit
import CleverTapSDK

class ViewController: UIViewController, Themeable {
    
    // MARK: - UI Components
    private var headerView: HeaderView!
    private let carousel = CarouselView()
    private var challengesSectionView: ThreeImageCardSectionView!
    private var categoriesSectionView: ThreeImageCardSectionView!
    
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
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
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
            headerView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    // MARK: - CAROUSEL
    private func setupCarousel() {
        carousel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(carousel)
        
        NSLayoutConstraint.activate([
            carousel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            carousel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            carousel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            carousel.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        carousel.items = [
            .url("https://picsum.photos/400/200?random=1"),
            .url("https://picsum.photos/400/200?random=2"),
            .url("https://picsum.photos/400/200?random=3")
        ]
        
        carousel.startAutoScroll()
    }
    
    // MARK: - CHALLENGES
    private func setupChallengeSection() {
        challengesSectionView = ThreeImageCardSectionView(
            title: AppStrings.Home.challengesTitle,
            items: [
                .init(imageName: "aia_challeng_1", title: AppStrings.ChallengeItems.run, url: nil),
                .init(imageName: "aia_challeng_2", title: AppStrings.ChallengeItems.yoga, url: nil),
                .init(imageName: "aia_challeng_3", title: AppStrings.ChallengeItems.meditate, url: nil)
            ],
            onSelect: { index, item in
                print("Selected Challenge:", item.title)
            }
        )
        
        challengesSectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(challengesSectionView)
        
        NSLayoutConstraint.activate([
            challengesSectionView.topAnchor.constraint(equalTo: carousel.bottomAnchor, constant: 10),
            challengesSectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            challengesSectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            challengesSectionView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    // MARK: - CATEGORIES
    private func setupCategoriesSection() {
        categoriesSectionView = ThreeImageCardSectionView(
            title: AppStrings.Home.categoriesTitle,
            items: [
                .init(imageName: "car-inusrance", title: AppStrings.CategoryItems.carInsurance, url: nil),
                .init(imageName: "Health_Insaurance", title: AppStrings.CategoryItems.healthInsurance, url: nil),
                .init(imageName: "Life_Insauracne", title: AppStrings.CategoryItems.lifeInsurance, url: nil)
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
            categoriesSectionView.topAnchor.constraint(equalTo: challengesSectionView.bottomAnchor, constant: 20),
            categoriesSectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            categoriesSectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            categoriesSectionView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    // MARK: - LOGIN BUTTON
    private func setupLoginButton() {
        let loginBtn = PrimaryButton(
            title: AppStrings.Home.login,
            icon: AppImages.Icons.login,
            iconPosition: .left,
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
            dashboardBtn.topAnchor.constraint(equalTo: categoriesSectionView.bottomAnchor, constant: 80),
            dashboardBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dashboardBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dashboardBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
