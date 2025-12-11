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
    private var decorativeCircles: [UIView] = []
    private var buttonAction: (() -> Void)?

    // MARK: - Init
    public init(
        title: String,
        subtitle: String,
        buttonTitle: String,
        backgroundColors: [UIColor]? = nil,
        image: UIImage?,
        action: (() -> Void)?
    ) {
        super.init(frame: .zero)
        self.buttonAction = action

        setupUI()
        applyTheme()

        // Optional custom gradient
        if let colors = backgroundColors {
            setupCustomGradient(colors)
        }

        titleLabel.text = title
        subtitleLabel.text = subtitle
        actionButton.setTitle(buttonTitle, for: .normal)
        carImageView.image = image
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - Theme Applying
    private func applyTheme() {
        let theme = AppTheme.shared.current

        // Gradient background (theme primary)
        gradientLayer.colors = [
            theme.primary.withAlphaComponent(0.95).cgColor,
            theme.primary.withAlphaComponent(0.75).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)

        // Card styling
        layer.cornerRadius = theme.cornerRadius
        layer.shadowOpacity = theme.shadowOpacity
        layer.shadowRadius = theme.shadowRadius
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowColor = UIColor.black.cgColor

        // Title
        titleLabel.font = theme.headerFont
        titleLabel.textColor = theme.textPrimary

        // Subtitle
        subtitleLabel.font = theme.bodyFont
        subtitleLabel.textColor = theme.textPrimary.withAlphaComponent(0.85)

        // Button styling
        actionButton.backgroundColor = theme.cardBackground
        actionButton.tintColor = theme.primary
        actionButton.titleLabel?.font = theme.buttonFont
        actionButton.layer.cornerRadius = theme.cornerRadius / 2
        actionButton.layer.borderColor = theme.primary.cgColor
        actionButton.layer.borderWidth = 2

        // Decorative circles
        decorativeCircles.forEach { circle in
            circle.backgroundColor = theme.cardBackground.withAlphaComponent(0.10)
        }
    }


    // MARK: Auto-update on system theme
    public override func traitCollectionDidChange(_ previous: UITraitCollection?) {
        super.traitCollectionDidChange(previous)
        applyTheme()
    }


    // MARK: - UI Setup
    private func setupUI() {

        layer.insertSublayer(gradientLayer, at: 0)

        // TITLE
        titleLabel.numberOfLines = 0
        subtitleLabel.numberOfLines = 2

        // BUTTON
        actionButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
        actionButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        // IMAGE
        carImageView.contentMode = .scaleAspectFill

        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(actionButton)
        addSubview(carImageView)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        carImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Title
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            // Subtitle
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            // Button
            actionButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            // Image
            carImageView.topAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: 20),
            carImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            carImageView.widthAnchor.constraint(equalToConstant: 160),
            carImageView.heightAnchor.constraint(equalToConstant: 180),
        ])

        addDecorativeCircles()
    }


    // MARK: - Custom Gradient (Optional)
    private func setupCustomGradient(_ colors: [UIColor]) {
        gradientLayer.colors = colors.map { $0.cgColor }
    }


    // MARK: - Decorative Circles
    private func addDecorativeCircles() {

        func makeCircle(size: CGFloat, alpha: CGFloat) -> UIView {
            let v = UIView()
            v.layer.cornerRadius = size / 2
            v.backgroundColor = .white.withAlphaComponent(alpha)
            v.translatesAutoresizingMaskIntoConstraints = false

            addSubview(v)
            decorativeCircles.append(v)

            NSLayoutConstraint.activate([
                v.widthAnchor.constraint(equalToConstant: size),
                v.heightAnchor.constraint(equalToConstant: size)
            ])

            return v
        }

        let c1 = makeCircle(size: 120, alpha: 0.08)
        let c2 = makeCircle(size: 80, alpha: 0.06)
        let c3 = makeCircle(size: 60, alpha: 0.08)

        // Positioning
        NSLayoutConstraint.activate([
            c1.topAnchor.constraint(equalTo: topAnchor, constant: -30),
            c1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 30),

            c2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 30),
            c2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -20),

            c3.centerYAnchor.constraint(equalTo: centerYAnchor),
            c3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 40)
        ])
    }


    // MARK: - Layout
    public override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    // MARK: - Action
    @objc func buttonPressed() {
        buttonAction?()
    }
}
