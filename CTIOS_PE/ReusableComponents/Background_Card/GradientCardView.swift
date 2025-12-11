//
//  GradientCardView.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 11/12/25.
//


//
//  GradientCardView.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 11/12/25.
//

import UIKit

final class GradientCardView: UIView, Themeable {

    private let gradientLayer = CAGradientLayer()
    private var decorativeCircles: [UIView] = []

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupDecorations()
        applyTheme(AppTheme.shared.current)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupDecorations()
        applyTheme(AppTheme.shared.current)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    // MARK: - Theme Handling
    func applyTheme(_ theme: ThemeProtocol) {

        // Background gradient
        gradientLayer.colors = [
            theme.primary.withAlphaComponent(0.90).cgColor,
            theme.primary.withAlphaComponent(0.65).cgColor
        ]

        // Circle tinting
        for (index, circle) in decorativeCircles.enumerated() {
            let alpha: CGFloat = [0.15, 0.12, 0.10][index]
            circle.backgroundColor = theme.cardBackground.withAlphaComponent(alpha)
        }

        setNeedsLayout()
        layoutIfNeeded()
    }

    override func traitCollectionDidChange(_ previous: UITraitCollection?) {
        super.traitCollectionDidChange(previous)
        applyTheme(AppTheme.shared.current)
    }

    // MARK: - Setup Core View
    private func setupView() {
        layer.cornerRadius = 20
        clipsToBounds = true

        gradientLayer.cornerRadius = 20
        layer.insertSublayer(gradientLayer, at: 0)
    }

    // MARK: - Decorative Circles
    private func setupDecorations() {

        func makeCircle(size: CGFloat) -> UIView {
            let v = UIView()
            v.layer.cornerRadius = size / 2
            v.translatesAutoresizingMaskIntoConstraints = false
            addSubview(v)

            NSLayoutConstraint.activate([
                v.widthAnchor.constraint(equalToConstant: size),
                v.heightAnchor.constraint(equalToConstant: size)
            ])

            decorativeCircles.append(v)
            return v
        }

        let c1 = makeCircle(size: 140)
        let c2 = makeCircle(size: 90)
        let c3 = makeCircle(size: 60)

        NSLayoutConstraint.activate([
            c1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -30),
            c1.topAnchor.constraint(equalTo: topAnchor, constant: -25),

            c2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            c2.topAnchor.constraint(equalTo: topAnchor, constant: 30),

            c3.centerXAnchor.constraint(equalTo: centerXAnchor),
            c3.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25)
        ])
    }
}
