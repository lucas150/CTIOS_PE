//
//  ThreeImageCardItem.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 03/12/25.
//


import UIKit

struct ThreeImageCardItem {
    let imageName: String      // local name OR URL
    let title: String          // optional label below image
    let url: String?           // optional deep link / click action
}

class ThreeImageCardSectionView: UIView {

    // MARK: - UI
    private let titleLabel = UILabel()
    private let hStack = UIStackView()
    private var items: [ThreeImageCardItem] = []
    private var onSelect: ((Int, ThreeImageCardItem) -> Void)?

    // MARK: - Init
    init(title: String,
         items: [ThreeImageCardItem],
         onSelect: ((Int, ThreeImageCardItem) -> Void)? = nil) {

        super.init(frame: .zero)
        self.items = items
        self.onSelect = onSelect
        setupUI(title: title)
        buildTiles()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - Setup UI
    private func setupUI(title: String) {

        backgroundColor = .white
        layer.cornerRadius = 16
        layer.shadowOpacity = 0.12
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 4)
        translatesAutoresizingMaskIntoConstraints = false

        // Title
        titleLabel.text = title
        titleLabel.font = .boldSystemFont(ofSize: 20)

        // Horizontal Tile Stack
        hStack.axis = .horizontal
        hStack.distribution = .fillEqually
        hStack.spacing = 12
        hStack.translatesAutoresizingMaskIntoConstraints = false

        // Layout
        let internalStack = UIStackView(arrangedSubviews: [titleLabel, hStack])
        internalStack.axis = .vertical
        internalStack.spacing = 12
        internalStack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(internalStack)

        NSLayoutConstraint.activate([
            internalStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            internalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            internalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            internalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            hStack.heightAnchor.constraint(equalToConstant: 110)   // 🔥 keep same size always
        ])
    }

    // MARK: - Build Tiles
    private func buildTiles() {
        for (index, item) in items.enumerated() {
            hStack.addArrangedSubview(makeTile(item: item, index: index))
        }
    }

    // MARK: - Make Single Tile
    private func makeTile(item: ThreeImageCardItem, index: Int) -> UIView {
        let container = UIView()
        container.layer.cornerRadius = 12
        container.layer.shadowOpacity = 0.1
        container.layer.shadowRadius = 6
        container.layer.shadowOffset = CGSize(width: 0, height: 3)
        container.clipsToBounds = false
        container.translatesAutoresizingMaskIntoConstraints = false

        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = 12
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(imgView)

        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: container.topAnchor),
            imgView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            imgView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])

        // Load local or remote image
        if item.imageName.starts(with: "http") {
            loadImage(from: item.imageName, into: imgView)
        } else {
            imgView.image = UIImage(named: item.imageName)
        }

        // Add Tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(tileTapped(_:)))
        container.addGestureRecognizer(tap)
        container.tag = index

        return container
    }

    // MARK: - Tap Handler
    @objc private func tileTapped(_ sender: UITapGestureRecognizer) {
        guard let index = sender.view?.tag else { return }
        onSelect?(index, items[index])
    }
}
