//
//  Themeable.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 11/12/25.
//


import UIKit

protocol Themeable: AnyObject {
    /// Called whenever theme changes (including iOS dark/light mode)
    func applyTheme(_ theme: ThemeProtocol)
}
