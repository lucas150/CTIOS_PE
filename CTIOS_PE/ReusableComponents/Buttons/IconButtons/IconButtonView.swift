//
//  IconButtonView.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 11/12/25.
//


import UIKit

final class IconButtonView: UIControl, Themeable {

    private let bgCircle = UIView()
    private let iconView = UIImageView()
    private let titleLabel = UILabel()
    private var haptic = UIImpactFeedbackGenerator(style: .light)


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        applyTheme(AppTheme.shared.current)
        haptic.prepare()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onThemeChange),
            name: .themeDidChange,
            object: nil
        )
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(icon: UIImage?, title: String) {
        titleLabel.text = title
        iconView.image = icon?.withRenderingMode(.alwaysTemplate)

    }

    private func setupUI() {

        //user Interaction
        isUserInteractionEnabled = true
        bgCircle.isUserInteractionEnabled = false
        titleLabel.isUserInteractionEnabled = false
        iconView.isUserInteractionEnabled = false

        
        // Circle background
        bgCircle.layer.cornerRadius = 30
        bgCircle.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bgCircle)

        NSLayoutConstraint.activate([
            bgCircle.widthAnchor.constraint(equalToConstant: 60),
            bgCircle.heightAnchor.constraint(equalToConstant: 60),
            bgCircle.centerXAnchor.constraint(equalTo: centerXAnchor),
            bgCircle.topAnchor.constraint(equalTo: topAnchor)
        ])

        // Icon
        iconView.contentMode = .scaleAspectFit
        iconView.translatesAutoresizingMaskIntoConstraints = false
        bgCircle.addSubview(iconView)

        NSLayoutConstraint.activate([
            iconView.centerXAnchor.constraint(equalTo: bgCircle.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: bgCircle.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 28),
            iconView.heightAnchor.constraint(equalToConstant: 28)
        ])

        // Label
        titleLabel.font = AppTheme.shared.current.smallFont
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: bgCircle.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        // Touch feedback
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        addTarget(self, action: #selector(touchUpInsideHandler), for: .touchUpInside)
        addTarget(self, action: #selector(touchUpCancelHandler), for: [.touchUpOutside, .touchCancel])
    }

    // MARK: Theme
    func applyTheme(_ theme: ThemeProtocol) {
        bgCircle.backgroundColor = theme.cardBackground.withAlphaComponent(
            traitCollection.userInterfaceStyle == .dark ? 0.3 : 1.0
        )
        titleLabel.textColor = theme.textPrimary
        iconView.tintColor = theme.primary
        
    }
    @objc private func onThemeChange() {
        applyTheme(AppTheme.shared.current)
        
    }

    


    @objc private func touchDown() {
        UIView.animate(withDuration: 0.12) {
            self.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }
    }

    @objc private func touchUpInsideHandler() {
        UIView.animate(withDuration: 0.12) {
            self.transform = .identity
        }

        // Haptic
        haptic.impactOccurred()

        // Log
        print("Icon tapped →", titleLabel.text ?? "Unknown")

        // Notify parent
        sendActions(for: .primaryActionTriggered)
    }
    

    @objc private func touchUpCancelHandler() {
        UIView.animate(withDuration: 0.12) {
            self.transform = .identity
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        applyTheme(AppTheme.shared.current)
    }


}
