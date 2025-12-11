//
//  IconRowView.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 11/12/25.
//


import UIKit

final class IconRowView: UIStackView {

    init(items: [(icon: UIImage?, title: String)], startTag: Int = 0, target: Any?, action: Selector) {
        super.init(frame: .zero)

        axis = .horizontal
        distribution = .fillEqually
        spacing = 24
        alignment = .center
        translatesAutoresizingMaskIntoConstraints = false

        for (i, item) in items.enumerated() {
            let button = IconButtonView()
            button.configure(icon: item.icon, title: item.title)
            button.tag = startTag + i
            button.addTarget(target, action: action, for: .touchUpInside)
            addArrangedSubview(button)
        }
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
