//
//  CategoryButton.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 02/12/25.
//

import UIKit


class CategoryButton: UIControl {

    private let bgCircle = UIView()
    private let iconView = UIImageView()
    private let titleLabel = UILabel()

    var item: CategoryItem!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {

        // Circle
        bgCircle.layer.cornerRadius = 35
        bgCircle.backgroundColor = .white
        bgCircle.layer.shadowOpacity = 0.12
        bgCircle.layer.shadowRadius = 6
        bgCircle.layer.shadowOffset = CGSize(width: 0, height: 4)
        bgCircle.translatesAutoresizingMaskIntoConstraints = false

        // Icon
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = .systemBlue
        iconView.translatesAutoresizingMaskIntoConstraints = false

        bgCircle.addSubview(iconView)

        NSLayoutConstraint.activate([
            iconView.centerXAnchor.constraint(equalTo: bgCircle.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: bgCircle.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 32),
            iconView.heightAnchor.constraint(equalToConstant: 32)
        ])

        // Title
        titleLabel.font = .systemFont(ofSize: 13, weight: .medium)
        titleLabel.textColor = .darkGray
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let vStack = UIStackView(arrangedSubviews: [bgCircle, titleLabel])
        vStack.axis = .vertical
        vStack.spacing = 8
        vStack.alignment = .center
        vStack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(vStack)

        NSLayoutConstraint.activate([
            bgCircle.widthAnchor.constraint(equalToConstant: 70),
            bgCircle.heightAnchor.constraint(equalToConstant: 70),

            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func configure(with item: CategoryItem) {
        self.item = item
        iconView.image = UIImage(named: item.imageName)
        titleLabel.text = item.title
    }
}
