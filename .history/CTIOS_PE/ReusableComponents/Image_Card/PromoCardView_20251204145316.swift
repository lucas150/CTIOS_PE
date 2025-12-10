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

            // TITLE - Left side, leaving space for car
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: centerXAnchor, constant: 30),

            // SUBTITLE - Left side below title
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: centerXAnchor, constant: 30),

            // BUTTON - Left side below subtitle
            actionButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            actionButton.widthAnchor.constraint(lessThanOrEqualToConstant: 140),

            // CAR IMAGE - Right side, overlapping with content area
            carImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20),
            carImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            carImageView.leadingAnchor.constraint(greaterThanOrEqualTo: centerXAnchor, constant: -50),
            carImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 280),
            carImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 180),

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
        
        // Add decorative elements
        addDecorativeElements()
    }
    
    func addDecorativeElements() {
        // Create decorative circles for visual appeal
        let circle1 = createDecorativeCircle(size: 120, alpha: 0.1)
        let circle2 = createDecorativeCircle(size: 80, alpha: 0.08)
        let circle3 = createDecorativeCircle(size: 60, alpha: 0.12)
        
        addSubview(circle1)
        addSubview(circle2)
        addSubview(circle3)
        
        // Send circles to back but above gradient
        sendSubviewToBack(circle1)
        sendSubviewToBack(circle2)
        sendSubviewToBack(circle3)
        
        NSLayoutConstraint.activate([
            // Large circle - top right
            circle1.topAnchor.constraint(equalTo: topAnchor, constant: -30),
            circle1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            
            // Medium circle - bottom left
            circle2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            circle2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -20),
            
            // Small circle - center right
            circle3.centerYAnchor.constraint(equalTo: centerYAnchor),
            circle3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 30)
        ])
    }
    
    func createDecorativeCircle(size: CGFloat, alpha: CGFloat) -> UIView {
        let circle = UIView()
        circle.backgroundColor = UIColor.white.withAlphaComponent(alpha)
        circle.layer.cornerRadius = size / 2
        circle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            circle.widthAnchor.constraint(equalToConstant: size),
            circle.heightAnchor.constraint(equalToConstant: size)
        ])
        
        return circle
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    @objc func buttonPressed() {
        buttonAction?()
    }
}
