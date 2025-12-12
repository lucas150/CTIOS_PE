//
//  LightTheme.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 10/12/25.
//


import UIKit

struct LightTheme: ThemeProtocol {
    // Colors
    var primary: UIColor = UIColor(hex: "#D8242A")
    var background: UIColor = UIColor(hex: "#F7F7F7")
    var cardBackground: UIColor = .white
    var textPrimary: UIColor = UIColor(hex: "#1A1A1A")
    var textSecondary: UIColor = UIColor(hex: "#666666")
    var border: UIColor = UIColor(hex: "#E5E5E5")

    // Fonts
    var headerFont = UIFont.systemFont(ofSize: 22, weight: .bold)
    var titleFont = UIFont.systemFont(ofSize: 18, weight: .semibold)
    var subtitleFont = UIFont.systemFont(ofSize: 16, weight: .medium)
    var bodyFont = UIFont.systemFont(ofSize: 14, weight: .regular)
    var smallFont = UIFont.systemFont(ofSize: 12, weight: .regular)
    var buttonFont: UIFont { UIFont.systemFont(ofSize: 16, weight: .semibold) }

    // UI Properties
    var cornerRadius: CGFloat = 18
    var shadowOpacity: Float = 0.1
    var shadowRadius: CGFloat = 6
    var spacing: CGFloat = 12
}




