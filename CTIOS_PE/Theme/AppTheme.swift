//
//  AppTheme.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 10/12/25.
//

import UIKit

class AppTheme {
    static let shared = AppTheme()

    private init() {}

    var current: ThemeProtocol {
        if UITraitCollection.current.userInterfaceStyle == .dark {
            return DarkTheme()
        } else {
            return LightTheme()
        }
    }
}
