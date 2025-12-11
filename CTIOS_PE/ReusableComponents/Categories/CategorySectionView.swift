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

    // MARK: - Init
    init(title: String,
         items: [CategoryItem],
         onSelect: ((Int, CategoryItem) -> Void)? = nil) {

        super.init(frame: .zero)
        self.items = items
        self.selectionHandler = onSelect

        setupUI(title: title)
        setupButtons()
        applyTheme()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        applyTheme()
    }

    // MARK: - UI Setup
    private func setupUI(title: String) {

        // Title Label
        titleLabel.text = title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        // Stack View
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(titleLabel)
        addSubview(stack)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),

            stack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            stack.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    // MARK: - THEME APPLYING
    func applyTheme() {
        let theme = AppTheme.shared.current

        // Background
        backgroundColor = theme.cardBackground

        // Corner radius
        layer.cornerRadius = theme.cornerRadius

        // Shadow (enabled only in light mode)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = theme.shadowOpacity
        layer.shadowRadius = theme.shadowRadius
        layer.shadowOffset = CGSize(width: 0, height: 3)

        // Title Colors & Font
        titleLabel.textColor = theme.textPrimary
        titleLabel.font = theme.titleFont

        // Update buttons inside
        for sub in stack.arrangedSubviews {
            if let btn = sub as? CategoryButton {
                btn.applyTheme()
            }
        }
    }

    // Auto-update for system theme
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        applyTheme()
    }

    // MARK: - Add Buttons
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
}
