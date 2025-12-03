//
//  PrimaryButton.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 03/12/25.
//


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
        cornerRadius: CGFloat = 16,
        action: (() -> Void)? = nil
    ) {
        super.init(frame: .zero)
        self.actionHandler = action
        setup(title: title, icon: icon, position: iconPosition, backgroundColor: backgroundColor, textColor: textColor, cornerRadius: cornerRadius)
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
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor

        // MARK: - UIButton Configuration
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = backgroundColor
        config.baseForegroundColor = textColor
        config.cornerStyle = .fixed

        // Image + position
        if let icon = icon {
            config.image = icon
            config.imagePadding = 8
            config.imagePlacement = (position == .left) ? .leading : .trailing
        }

        config.title = title
        self.configuration = config

        self.addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }

    @objc private func didTap() {
        actionHandler?()
    }

    func updateTheme(background: UIColor, text: UIColor) {
        self.configuration?.baseBackgroundColor = background
        self.configuration?.baseForegroundColor = text
        self.backgroundColor = background
    }
}
