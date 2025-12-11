//
//  CarouselCell.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 01/12/25.
//

import UIKit
class CarouselCell: UICollectionViewCell {

    let imgView = UIImageView()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        applyTheme()
 
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    
    private func setupUI(){
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imgView)

        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    // MARK: - THEME APPLYING
     func applyTheme() {
         let theme = AppTheme.shared.current


         imgView.layer.cornerRadius = theme.cornerRadius
         contentView.layer.cornerRadius = theme.cornerRadius

         layer.shadowColor = UIColor.black.cgColor
         layer.shadowOpacity = theme.shadowOpacity   // 0 in dark mode -> no shadow
         layer.shadowOffset = CGSize(width: 0, height: 4)
         layer.shadowRadius = theme.shadowRadius
     }
    
    
    // Auto-update theme on light/dark mode change
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        applyTheme()
    }



    func configure(with item: CarouselItem) {
        switch item {
        case .url(let urlString):
            loadImage(from: urlString)
        case .image(let img):
            imgView.image = img
        }
    }

    private func loadImage(from url: String) {
        guard let link = URL(string: url) else { return }
        URLSession.shared.dataTask(with: link) { data, _, _ in
            if let data = data, let img = UIImage(data: data) {
                DispatchQueue.main.async { self.imgView.image = img }
            }
        }.resume()
    }
}

