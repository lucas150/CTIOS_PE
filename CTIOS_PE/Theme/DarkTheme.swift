//
//  DarkTheme.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 10/12/25.
//

import UIKit

struct DarkTheme: ThemeProtocol {

    private let ct = CleverTapVariables.shared

    // MARK: - Colors
    var primary: UIColor {
        UIColor(hex: ct.dark_primary)
    }

    var background: UIColor {
        UIColor(hex: ct.dark_background)
    }

    var cardBackground: UIColor {
        UIColor(hex: ct.dark_cardBackground)
    }

    var textPrimary: UIColor {
        UIColor(hex: ct.dark_textPrimary)
    }

    var textSecondary: UIColor {
        UIColor(hex: ct.dark_textSecondary)
    }

    var border: UIColor {
        UIColor(hex: ct.dark_border)
    }

    // MARK: - Font Mapping Helper
    private func font(weight: String, size: Int) -> UIFont {
        switch weight.lowercased() {
        case "bold": return .systemFont(ofSize: CGFloat(size), weight: .bold)
        case "semibold": return .systemFont(ofSize: CGFloat(size), weight: .semibold)
        case "medium": return .systemFont(ofSize: CGFloat(size), weight: .medium)
        default: return .systemFont(ofSize: CGFloat(size), weight: .regular)
        }
    }

    // MARK: - Fonts (Dynamic)
    var headerFont: UIFont {
        font(weight: ct.dark_headerFont_weight, size: ct.dark_headerFont)
    }

    var titleFont: UIFont {
        font(weight: ct.dark_titleFont_weight, size: ct.dark_titleFont)
    }

    var subtitleFont: UIFont {
        font(weight: ct.dark_subtitleFont_weight, size: ct.dark_subtitleFont)
    }

    var bodyFont: UIFont {
        font(weight: ct.dark_bodyFont_weight, size: ct.dark_bodyFont)
    }

    var smallFont: UIFont {
        font(weight: ct.dark_smallFont_weight, size: ct.dark_smallFont)
    }

    var buttonFont: UIFont {
        font(weight: ct.dark_buttonFont_weight, size: ct.dark_buttonFont)
    }

    // MARK: - UI Properties (Static)
    var cornerRadius: CGFloat = 18
    var shadowOpacity: Float = 0.0
    var shadowRadius: CGFloat = 0
    var spacing: CGFloat = 12
}
