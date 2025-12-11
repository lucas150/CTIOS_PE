//
//  ThemeProtocol.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 10/12/25.
//


import UIKit

protocol ThemeProtocol {
    // Colors
    var primary: UIColor { get }
    var background: UIColor { get }
    var cardBackground: UIColor { get }
    var textPrimary: UIColor { get }
    var textSecondary: UIColor { get }
    var border: UIColor { get }

    // Fonts
    var headerFont: UIFont { get }
    var titleFont: UIFont { get }
    var subtitleFont: UIFont { get }
    var bodyFont: UIFont { get }
    var smallFont: UIFont { get }
    var buttonFont: UIFont { get }

    // Common UI Properties
    var cornerRadius: CGFloat { get }
    var shadowOpacity: Float { get }
    var shadowRadius: CGFloat { get }
    var spacing: CGFloat { get }
}
