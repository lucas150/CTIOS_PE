//
//  DarkTheme.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 10/12/25.
//


import UIKit

struct DarkTheme: ThemeProtocol {
    // Colors
    var primary: UIColor = UIColor(hex: "#FF4E4E")
    var background: UIColor = UIColor(hex: "#121212")
    var cardBackground: UIColor = UIColor(hex: "#1E1E1E")
    var textPrimary: UIColor = .white
    var textSecondary: UIColor = UIColor(hex: "#B3B3B3")
    var border: UIColor = UIColor(hex: "#333333")

    // Fonts (same unless you want changes)
    var headerFont = UIFont.systemFont(ofSize: 22, weight: .bold)
    var titleFont = UIFont.systemFont(ofSize: 18, weight: .semibold)
    var subtitleFont = UIFont.systemFont(ofSize: 16, weight: .medium)
    var bodyFont = UIFont.systemFont(ofSize: 14, weight: .regular)
    var smallFont = UIFont.systemFont(ofSize: 12, weight: .regular)
    var buttonFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .semibold)

    // UI Properties
    var cornerRadius: CGFloat = 18
    var shadowOpacity: Float = 0.0   // Dark theme rarely uses shadows
    var shadowRadius: CGFloat = 0
    var spacing: CGFloat = 12
}
