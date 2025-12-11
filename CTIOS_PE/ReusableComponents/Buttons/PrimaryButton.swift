////
////  PrimaryButton.swift
////  CTIOS_PE
////
////  Created by Henil Gandhi on 03/12/25.

import UIKit

class PrimaryButton: UIButton {

    enum IconPosition { case left, right }

    private var actionHandler: (() -> Void)?

    init(
        title: String,
        icon: UIImage? = nil,
        iconPosition: IconPosition = .left,
        action: (() -> Void)? = nil
    ) {
        super.init(frame: .zero)
        self.actionHandler = action
        setup(title: title, icon: icon, position: iconPosition)
        applyTouchEffects()
        applyShadow()
        applyTheme()  // Apply initial theme
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - Setup
    private func setup(
        title: String,
        icon: UIImage?,
        position: IconPosition
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds = false

        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.title = title

        // Typography (will be overridden by theme)
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = AppTheme.shared.current.titleFont
            return outgoing
        }

        if let icon = icon {
            config.image = icon.withRenderingMode(.alwaysTemplate)
            config.imagePlacement = (position == .left) ? .leading : .trailing
            config.imagePadding = 10
        }

        config.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 18, bottom: 14, trailing: 18)

        self.configuration = config

        addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }

    // MARK: - THEME APPLYING
    func applyTheme() {
        let theme = AppTheme.shared.current

        configuration?.baseBackgroundColor = theme.primary
        configuration?.baseForegroundColor = theme.textPrimary

        layer.cornerRadius = theme.cornerRadius

        // Update font if theme changes
        configuration?.titleTextAttributesTransformer =
        UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = theme.titleFont
            return outgoing
        }
    }

    // MARK: Auto-update when system appearance changes
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        applyTheme()
    }

    // MARK: - Shadow
    private func applyShadow() {
        let theme = AppTheme.shared.current
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = theme.shadowOpacity
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = theme.shadowRadius
    }

    // MARK: - Touch Effects
    private func applyTouchEffects() {
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        addTarget(self, action: #selector(touchUp), for: [.touchUpInside, .touchDragExit])
    }

    @objc private func touchDown() {
        UIView.animate(withDuration: 0.12) {
            self.alpha = 0.75
            self.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
        }
    }

    @objc private func touchUp() {
        UIView.animate(withDuration: 0.12) {
            self.alpha = 1
            self.transform = .identity
        }
    }

    @objc private func didTap() {
        animatePress()
        actionHandler?()
    }

    private func animatePress() {
        UIView.animate(withDuration: 0.10,
                       animations: { self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95) }) { _ in
            UIView.animate(withDuration: 0.10) {
                self.transform = .identity
            }
        }
    }
}
