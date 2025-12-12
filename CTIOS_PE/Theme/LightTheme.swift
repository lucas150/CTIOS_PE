//
//  LightTheme.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 10/12/25.
//
import UIKit

struct LightTheme: ThemeProtocol {

    private let ct = CleverTapVariables.shared

    // MARK: - Colors
    var primary: UIColor {
        UIColor(hex: ct.light_primary)
    }

    var background: UIColor {
        UIColor(hex: ct.light_background)
    }

    var cardBackground: UIColor {
        UIColor(hex: ct.light_cardBackground)
    }

    var textPrimary: UIColor {
        UIColor(hex: ct.light_textPrimary)
    }

    var textSecondary: UIColor {
        UIColor(hex: ct.light_textSecondary)
    }

    var border: UIColor {
        UIColor(hex: ct.light_border)
    }

    // MARK: - Font Helper
    private func font(weight: String, size: Int) -> UIFont {
        switch weight.lowercased() {
        case "bold": return .systemFont(ofSize: CGFloat(size), weight: .bold)
        case "semibold": return .systemFont(ofSize: CGFloat(size), weight: .semibold)
        case "medium": return .systemFont(ofSize: CGFloat(size), weight: .medium)
        default: return .systemFont(ofSize: CGFloat(size), weight: .regular)
        }
    }

    // MARK: - Fonts (Dynamic from CleverTap)
    var headerFont: UIFont {
        font(weight: ct.light_headerFont_weight, size: ct.light_headerFont)
    }

    var titleFont: UIFont {
        font(weight: ct.light_titleFont_weight, size: ct.light_titleFont)
    }

    var subtitleFont: UIFont {
        font(weight: ct.light_subtitleFont_weight, size: ct.light_subtitleFont)
    }

    var bodyFont: UIFont {
        font(weight: ct.light_bodyFont_weight, size: ct.light_bodyFont)
    }

    var smallFont: UIFont {
        font(weight: ct.light_smallFont_weight, size: ct.light_smallFont)
    }

    var buttonFont: UIFont {
        font(weight: ct.light_buttonFont_weight, size: ct.light_buttonFont)
    }

    // MARK: - UI Properties
    var cornerRadius: CGFloat = 18
    var shadowOpacity: Float = 0.1
    var shadowRadius: CGFloat = 6
    var spacing: CGFloat = 12
}
