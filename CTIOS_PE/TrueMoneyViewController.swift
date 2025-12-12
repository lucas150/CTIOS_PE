//
//  TrueMoneyViewController.swift
//  CTIOS_PE
//
//  Created by Pranjal Choudhary on 14/08/25.
//

import CleverTapSDK
import UIKit

class TrueMoneyViewController: UIViewController, Themeable {

    private let carousel = CarouselView()
    private var headerView: HeaderView!
    private var firstRow: IconRowView!
    private var secondRow: IconRowView!
    private var cardContainer: UIView!

    private var bannerImageUrls: [String] = [
        "https://picsum.photos/400/200?random=1",
        "https://picsum.photos/400/200?random=2",
        "https://picsum.photos/400/200?random=3",
    ]
    private var lastSelectedTag: Int? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        applyTheme(AppTheme.shared.current)

        setupHeader()
        setupCard()
        setupIconRows()
        setupCarousel()
        restoreCategoryState()
        refreshCarousel()
    }

    override func traitCollectionDidChange(
        _ previousTraitCollection: UITraitCollection?
    ) {
        super.traitCollectionDidChange(previousTraitCollection)
        applyTheme(AppTheme.shared.current)
    }

    func applyTheme(_ theme: ThemeProtocol) {
        view.backgroundColor = theme.background
    }

    // MARK: HEADER
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

    // MARK: CARD UI
    private func setupCard() {

        cardContainer = GradientCardView()
        cardContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardContainer)

        NSLayoutConstraint.activate([
            cardContainer.topAnchor.constraint(
                equalTo: headerView.bottomAnchor,
                constant: 20
            ),
            cardContainer.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            cardContainer.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),
            cardContainer.heightAnchor.constraint(equalToConstant: 180),
        ])

        let imgView = UIImageView(image: AppImages.Cards.cardBlack)
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        cardContainer.addSubview(imgView)

        NSLayoutConstraint.activate([
            imgView.centerXAnchor.constraint(
                equalTo: cardContainer.centerXAnchor
            ),
            imgView.centerYAnchor.constraint(
                equalTo: cardContainer.centerYAnchor
            ),
            imgView.widthAnchor.constraint(
                equalTo: cardContainer.widthAnchor,
                multiplier: 1.2
            ),
            imgView.heightAnchor.constraint(
                equalTo: cardContainer.heightAnchor,
                multiplier: 1.2
            ),
        ])
    }

    // MARK: ICON ROWS
    private func setupIconRows() {

        // Row 1
        firstRow = IconRowView(
            items: [
                (AppImages.DashboardIcons.bills, AppStrings.TrueMoney.bills),
                (
                    AppImages.DashboardIcons.insurance,
                    AppStrings.TrueMoney.insurance
                ),
                (
                    AppImages.DashboardIcons.electricity,
                    AppStrings.TrueMoney.electricity
                ),
                (
                    AppImages.DashboardIcons.prepaid,
                    AppStrings.TrueMoney.prepaid
                ),
            ],
            startTag: 0,
            target: self,
            action: #selector(iconTapped)
        )

        view.addSubview(firstRow)

        NSLayoutConstraint.activate([
            firstRow.topAnchor.constraint(
                equalTo: cardContainer.bottomAnchor,
                constant: 20
            ),
            firstRow.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            firstRow.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),
            firstRow.heightAnchor.constraint(equalToConstant: 100),
        ])

        // Row 2
        secondRow = IconRowView(
            items: [
                (AppImages.DashboardIcons.wallet, AppStrings.TrueMoney.wallet),
                (AppImages.DashboardIcons.home, AppStrings.TrueMoney.home),
                (
                    AppImages.DashboardIcons.rewards,
                    AppStrings.TrueMoney.rewards
                ),
                (AppImages.DashboardIcons.mobile, AppStrings.TrueMoney.mobile),
            ],
            startTag: 4,
            target: self,
            action: #selector(iconTapped)
        )

        view.addSubview(secondRow)

        NSLayoutConstraint.activate([
            secondRow.topAnchor.constraint(
                equalTo: firstRow.bottomAnchor,
                constant: 20
            ),
            secondRow.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            secondRow.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),
            secondRow.heightAnchor.constraint(equalToConstant: 100),
        ])
    }

    // MARK: CAROUSEL
    private func setupCarousel() {
        carousel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(carousel)

        NSLayoutConstraint.activate([
            carousel.topAnchor.constraint(
                equalTo: secondRow.bottomAnchor,
                constant: 20
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
    }

    private func refreshCarousel() {
        carousel.items = bannerImageUrls.map { .url($0) }
        carousel.startAutoScroll()
    }

    
    // MARK: CATEGORY LOGIC
    @objc private func iconTapped(_ sender: UIControl) {
        let tag = sender.tag
        lastSelectedTag = tag
        hapticFeedback()

        switch tag {
        case 0:
            print("Tapped Category:", tag)
        //            navigateTo(loadVC(BillsViewController.self))

        case 1:
            print("Tapped Category:", tag)
        //            navigateTo(loadVC(InsuranceViewController.self))

        case 2:
            print("Tapped Category:", tag)
        //            navigateTo(loadVC(ElectricityViewController.self))

        case 3: print("Tapped Category:", tag)
        //            navigateTo(loadVC(PrepaidViewController.self))

        case 4: print("Tapped Category:", tag)
        //            navigateTo(loadVC(WalletViewController.self))

        case 5: print("Tapped Category:", tag)
        //            navigateTo(loadVC(HomeViewController.self))

        case 6: print("Tapped Category:", tag)
        //            navigateTo(loadVC(RewardsViewController.self))

        case 7:
            print("Tapped Category:", tag)
            navigateTo(loadVC(SubscribeViewController.self))

        default:
            break
        }
    }

    private func hapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
    }

    private func restoreCategoryState() {
        // You can repopulate bannerImageUrls for saved category tag
    }
}
