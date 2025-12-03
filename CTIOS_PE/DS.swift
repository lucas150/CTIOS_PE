//
//  DS.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 02/12/25.
//


import UIKit

struct DS {

    // MARK: - Spacing
    struct Spacing {
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 16
        static let lg: CGFloat = 24
    }

    // MARK: - Corner Radius
    struct Radius {
        static let sm: CGFloat = 8
        static let md: CGFloat = 12
        static let lg: CGFloat = 16
    }

    // MARK: - Shadows
    struct Shadows {
        static let card = (opacity: 0.10, radius: 8.0, offset: CGSize(width: 0, height: 3))
    }

    // MARK: - Typography
    struct Fonts {
        static let title = UIFont.boldSystemFont(ofSize: 18)
        static let body = UIFont.systemFont(ofSize: 14)
        static let button = UIFont.boldSystemFont(ofSize: 16)
    }
}
