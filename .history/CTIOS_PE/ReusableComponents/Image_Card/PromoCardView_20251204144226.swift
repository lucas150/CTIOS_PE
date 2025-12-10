//
//  PromoCardView.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 04/12/25.
//

import UIKit

class PromoCardView: UIView {

    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let actionButton = UIButton(type: .system)
    private let carImageView = UIImageView()
    private let gradientLayer = CAGradientLayer()
    private var buttonAction: (() -> Void)?

    // MARK: - Initializer
    init(
        title: String,
        subtitle: String,
        buttonTitle: String,
        backgroundColors: [UIColor],
        image: UIImage?,
        action: (() -> Void)?
    ) {
        super.init(frame: .zero)
        self.buttonAction = action

        setupUI()
        setupGradient(colors: backgroundColors)

        titleLabel.text = title
        subtitleLabel.text = subtitle
        actionButton.setTitle(buttonTitle, for: .normal)
        carImageView.image = image
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - UI Setup
private extension PromoCardView {

    func setupUI() {

        layer.cornerRadius = 22
        clipsToBounds = true

        // TITLE
        titleLabel.font = .boldSystemFont(ofSize: 26)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0

        // SUBTITLE
        subtitleLabel.font = .systemFont(ofSize: 17)
        subtitleLabel.textColor = .white
        subtitleLabel.numberOfLines = 2

        // BUTTON - Updated styling to match design
        actionButton.setTitleColor(UIColor.systemOrange, for: .normal)
        actionButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        actionButton.backgroundColor = .white
        actionButton.layer.cornerRadius = 8
        actionButton.layer.borderWidth = 2
        actionButton.layer.borderColor = UIColor.systemBlue.cgColor
        actionButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
        actionButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        // CAR IMAGE
        carImageView.contentMode = .scaleAspectFit
        carImageView.clipsToBounds = true
        carImageView.backgroundColor = .clear

        // Add subviews
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(actionButton)
        addSubview(carImageView)

        // Autolayout
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        carImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            // TITLE
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: centerXAnchor, constant: 10),

            // SUBTITLE
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: centerXAnchor, constant: 10),

            // BUTTON - Positioned below subtitle
            actionButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            actionButton.widthAnchor.constraint(lessThanOrEqualToConstant: 120),

            // CAR IMAGE - Better positioning on the right side
            carImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            carImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            carImageView.leadingAnchor.constraint(greaterThanOrEqualTo: centerXAnchor, constant: -30),
            carImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 180),
            carImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 120),

            // Ensures card has minimum height
            bottomAnchor.constraint(greaterThanOrEqualTo: actionButton.bottomAnchor, constant: 20),
            bottomAnchor.constraint(greaterThanOrEqualTo: carImageView.bottomAnchor, constant: 10)
        ])
    }

    func setupGradient(colors: [UIColor]) {
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        layer.insertSublayer(gradientLayer, at: 0)
    }

    internal override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    @objc func buttonPressed() {
        buttonAction?()
    }
}
