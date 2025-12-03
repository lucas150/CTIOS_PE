//
//  CarouselCell.swift
//

import UIKit

final class CarouselCell: UICollectionViewCell {

    private let imgView = UIImageView()
    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))

    override init(frame: CGRect) {
        super.init(frame: frame)

        imgView.translatesAutoresizingMaskIntoConstraints = false
        blurView.translatesAutoresizingMaskIntoConstraints = false

        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = 20
        imgView.clipsToBounds = true

        blurView.clipsToBounds = true
        blurView.layer.cornerRadius = 20
        blurView.alpha = 0        // default NO BLUR

        contentView.addSubview(imgView)
        contentView.addSubview(blurView)

        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            blurView.topAnchor.constraint(equalTo: contentView.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        // Soft shadow
        layer.shadowOpacity = 0.15
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.masksToBounds = false
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) not implemented") }

    func configure(with item: CarouselItem) {
        switch item {
        case .url(let url):
            loadImage(url)
        case .image(let img):
            imgView.image = img
        }
    }

    func setBlurProgress(_ progress: CGFloat) {
        // strong blur only near the edge
        let blur = min(0.8, max(0.0, progress))
        blurView.alpha = blur
    }

    private func loadImage(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let d = data, let img = UIImage(data: d) {
                DispatchQueue.main.async { self.imgView.image = img }
            }
        }.resume()
    }
}
