//
//  PromoCardView.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 04/12/25.
//

import UIKit

public class PromoCardView: UIView {

    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let actionButton = UIButton(type: .system)
    private let carImageView = UIImageView()
    private let gradientLayer = CAGradientLayer()
    private var buttonAction: (() -> Void)?

    // MARK: - Initializer
    public init(
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

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    public func updateContent(title: String? = nil, subtitle: String? = nil, buttonTitle: String? = nil, image: UIImage? = nil) {
        if let title = title { titleLabel.text = title }
        if let subtitle = subtitle { subtitleLabel.text = subtitle }
        if let buttonTitle = buttonTitle { actionButton.setTitle(buttonTitle, for: .normal) }
        if let image = image { carImageView.image = image }
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
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)

        // SUBTITLE
        subtitleLabel.font = .systemFont(ofSize: 17)
        subtitleLabel.textColor = .white
        subtitleLabel.numberOfLines = 2
        subtitleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        subtitleLabel.setContentCompressionResistancePriority(.required, for: .vertical)

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

            // TITLE - Full width at the top
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            // SUBTITLE - Full width below title
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            // BUTTON - Left side below subtitle
            actionButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            actionButton.widthAnchor.constraint(lessThanOrEqualToConstant: 140),

            // CAR IMAGE - Center below button
            carImageView.topAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: 20),
            carImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            carImageView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 10),
            carImageView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -10),
            carImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 360),
            carImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 240),

            // Ensures card has minimum height based on content
            bottomAnchor.constraint(equalTo: carImageView.bottomAnchor, constant: 20)
        ])
    }

    func setupGradient(colors: [UIColor]) {
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        layer.insertSublayer(gradientLayer, at: 0)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    @objc func buttonPressed() {
        buttonAction?()
    }
}
