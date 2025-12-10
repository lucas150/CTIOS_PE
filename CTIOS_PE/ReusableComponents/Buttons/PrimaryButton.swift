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
        backgroundColor: UIColor = .systemBlue,
        textColor: UIColor = .white,
        cornerRadius: CGFloat = 14,
        action: (() -> Void)? = nil
    ) {
        super.init(frame: .zero)
        self.actionHandler = action
        setup(title: title, icon: icon, position: iconPosition,
              backgroundColor: backgroundColor, textColor: textColor, cornerRadius: cornerRadius)
        applyTouchEffects()
        applyShadow()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private func setup(
        title: String,
        icon: UIImage?,
        position: IconPosition,
        backgroundColor: UIColor,
        textColor: UIColor,
        cornerRadius: CGFloat
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = cornerRadius
        clipsToBounds = true

        // MARK: Modern UIButton Configuration
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = backgroundColor
        config.baseForegroundColor = textColor
        config.cornerStyle = .capsule
        config.title = title

        // MARK: Typography Improvement
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            return outgoing
        }

        // MARK: Icon Support
        if let icon = icon {
            config.image = icon.withRenderingMode(.alwaysTemplate)
            config.imagePlacement = (position == .left) ? .leading : .trailing
            config.imagePadding = 10
        }

        // MARK: Better Button Padding
        config.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 18, bottom: 14, trailing: 18)

        self.configuration = config

        addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }

    @objc private func didTap() {
        animatePress()
        actionHandler?()
    }

    // MARK: - Shadow (Beautiful Elevated Look)
    private func applyShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.18
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 6
        layer.masksToBounds = false
    }

    // MARK: - Touch Feedback Animation
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

    private func animatePress() {
        UIView.animate(withDuration: 0.10,
                       animations: { self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95) }) { _ in
            UIView.animate(withDuration: 0.10) {
                self.transform = .identity
            }
        }
    }

    // MARK: Theme Updating
    func updateTheme(background: UIColor, text: UIColor) {
        configuration?.baseBackgroundColor = background
        configuration?.baseForegroundColor = text
    }
}
