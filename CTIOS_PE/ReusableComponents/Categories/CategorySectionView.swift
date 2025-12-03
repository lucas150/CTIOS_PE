//
//  CategorySectionView.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 02/12/25.
//

import UIKit

class CategorySectionView: UIView {

    private let titleLabel = UILabel()
    private let stack = UIStackView()

    private var items: [CategoryItem] = []
    private var selectionHandler: ((Int, CategoryItem) -> Void)?

    init(title: String,
         items: [CategoryItem],
         onSelect: ((Int, CategoryItem) -> Void)? = nil) {

        super.init(frame: .zero)
        self.items = items
        self.selectionHandler = onSelect

        setupUI(title: title)
        setupButtons()
        applyTheme()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(applyTheme),
            name: .themeDidChange,
            object: nil
        )
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupUI(title: String) {

        // Card style
        layer.cornerRadius = DS.Radius.lg
        layer.shadowOpacity = Float(DS.Shadows.card.opacity)
        layer.shadowRadius = DS.Shadows.card.radius
        layer.shadowOffset = DS.Shadows.card.offset

        // Title
        titleLabel.text = title
        titleLabel.font = DS.Fonts.title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        // Horizontal stack
        stack.axis = .horizontal
        stack.spacing = DS.Spacing.md
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(titleLabel)
        addSubview(stack)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: DS.Spacing.sm),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DS.Spacing.md),

            stack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: DS.Spacing.md),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DS.Spacing.md),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DS.Spacing.md),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -DS.Spacing.md),
            stack.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    private func setupButtons() {
        for (index, item) in items.enumerated() {

            let btn = CategoryButton()
            btn.configure(with: item)
            btn.tag = index
            btn.addTarget(self, action: #selector(categoryTapped(_:)), for: .touchUpInside)

            stack.addArrangedSubview(btn)
        }
    }

    @objc private func categoryTapped(_ sender: UIControl) {
        let index = sender.tag
        selectionHandler?(index, items[index])
    }

    // MARK: - Apply Theme
    @objc private func applyTheme() {
        let theme = ThemeManager.shared.currentTheme

        UIView.animate(withDuration: 0.25) {
            self.backgroundColor = theme.cardGradientBottom
            self.titleLabel.textColor = theme.headerTextColor
        }
    }
}
