//
//  ThemeManager.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 27/11/25.
//

import UIKit
import CleverTapSDK

class ThemeManager {
    static let shared = ThemeManager()
    
    private(set) var isChristmasThemeApplied = false
    
    private var backgroundColorHex: String?
    private var buttonBackgroundColorHex: String?
    private var buttonTextColorHex: String?
    
    private init() {
        loadThemeFromCleverTap()
    }
    
    func loadThemeFromCleverTap() {
        if let Christmas_Theme = CleverTap.sharedInstance()?.getVariableValue("Christmas Theme") as? [String: Any] {
            backgroundColorHex = Christmas_Theme["backgroundColorHex 1"] as? String
            print("backgroundColorHex =", backgroundColorHex ?? "nil")
            
            buttonBackgroundColorHex = Christmas_Theme["backgroundColorHex 2"] as? String
            print("buttonBackgroundColorHex =", buttonBackgroundColorHex ?? "nil")

            buttonTextColorHex = Christmas_Theme["buttonTextColorHex 3"] as? String
            print("buttonTextColorHex =", buttonTextColorHex ?? "nil")

        }
    }
    
    func toggleTheme() {
        isChristmasThemeApplied.toggle()
        NotificationCenter.default.post(name: .themeDidChange, object: nil)
    }
    
    func applyTheme(to viewController: UIViewController,
                   collectionView: UICollectionView? = nil,
                   themeButton: UIButton? = nil,
                   loginButton: UIButton? = nil,
                   labels: [UILabel] = []) {
        
        UIView.animate(withDuration: 0.3) {
            if self.isChristmasThemeApplied {
                // Apply Christmas Theme
                if let bgHex = self.backgroundColorHex {
                    viewController.view.backgroundColor = UIColor(hex: bgHex)
                    collectionView?.backgroundColor = UIColor(hex: bgHex)
                }
                
                if let btnBGHex = self.buttonBackgroundColorHex {
                    themeButton?.backgroundColor = UIColor(hex: btnBGHex)
                    loginButton?.backgroundColor = UIColor(hex: btnBGHex)
//                    loginButton?.applyPlainStyle()
                    
                }
                
                if let btnTextHex = self.buttonTextColorHex {
                    themeButton?.setTitleColor(UIColor(hex: btnTextHex), for: .normal)
                    labels.forEach { $0.textColor = UIColor(hex: btnTextHex) }
                    loginButton?.setTitleColor(UIColor(hex: btnTextHex), for: .normal)
                }
                
                
            } else {
                // Revert to Default Theme
                viewController.view.backgroundColor = .white
                collectionView?.backgroundColor = .white
                
                themeButton?.backgroundColor = .systemBlue
                themeButton?.setTitleColor(.white, for: .normal)
                
                loginButton?.backgroundColor = .systemBlue
                loginButton?.setTitleColor(.white, for: .normal)
                
                labels.forEach { $0.textColor = .black }
            }
        }
    }
}

extension Notification.Name {
    static let themeDidChange = Notification.Name("themeDidChange")
}
