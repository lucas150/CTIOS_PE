//
//  ThemeManager.swift
//  CTIOS_PE
//

import UIKit
import CleverTapSDK

class ThemeManager {
    static let shared = ThemeManager()
    
    private(set) var isChristmasThemeApplied = false
    
    // Default elements
    
    private var backgroundColorHex: String?
    private var SecondaryBackgroundColor: String?
    private var buttonTextColorHex: String?
    // TRUE MONEY Customizable Elements
    var headerGradientTopHex: String?
    var headerGradientBottomHex: String?
    var cardGradientTopHex: String?
    var cardGradientBottomHex: String?
    var iconTintHex: String?
    var viewBackgroundHex: String? = "#FFFFFF"   // main view background
    var appBackgroundHex: String? = "#FFFFFF"
    // scroll / container view bg
    var iconBackgroundHex: String?
    


    private init() {
        loadThemeFromCleverTap()
    }
    
    
    // MARK: - Load Theme (for now hardcoded)
    func loadThemeFromCleverTap() {

        // ⚠️ KEEP DEFAULT COLORS FROM CLEVERTAP IF AVAILABLE
        if let Christmas_Theme = CleverTap.sharedInstance()?.getVariableValue("Christmas Theme") as? [String: Any] {
            
            backgroundColorHex = Christmas_Theme["PrimaryBackgroundColor"] as? String
            SecondaryBackgroundColor = Christmas_Theme["SecondaryBackgroundColor"] as? String

            

//            buttonBackgroundColorHex = Christmas_Theme["backgroundColorHex 2"] as? String
            buttonTextColorHex = Christmas_Theme["buttonTextColorHex 3"] as? String
            
            // Header gradient → red shades
            headerGradientTopHex = Christmas_Theme["headerGradientTopHex"] as? String
            headerGradientBottomHex = Christmas_Theme["headerGradientTopHex"] as? String
            
            // Card gradient → soft red
            cardGradientTopHex = Christmas_Theme["cardGradientTopHex"] as? String
            cardGradientBottomHex = Christmas_Theme["cardGradientBottomHex"] as? String

            // Icon tint → strong red
            iconTintHex = Christmas_Theme["iconTintHex"] as? String
            iconBackgroundHex = "#3A3A3C"

        }

    }
    
    
    // MARK: - Toggle Theme
    func toggleTheme() {
        isChristmasThemeApplied.toggle()
        NotificationCenter.default.post(name: .themeDidChange, object: nil)
    }

    
    // MARK: - Apply Theme
    func applyTheme(
        to viewController: UIViewController,
        collectionView: UICollectionView? = nil,
        themeButton: UIButton? = nil,
        loginButton: UIButton? = nil,
        labels: [UILabel] = []
    ) {
        
        UIView.animate(withDuration: 0.3) {
            
            // 🎄 CHRISTMAS THEME ON
            if self.isChristmasThemeApplied {

                // ===== GRADIENTS =====
                if let top = self.headerGradientTopHex,
                   let bottom = self.headerGradientBottomHex,
                   let c1 = UIColor(hex: top),
                   let c2 = UIColor(hex: bottom),
                   let vc = viewController as? TrueMoneyViewController {

                    vc.applyHeaderGradient(topColor: c1, bottomColor: c2)
                }

                if let top = self.cardGradientTopHex,
                   let bottom = self.cardGradientBottomHex,
                   let c1 = UIColor(hex: top),
                   let c2 = UIColor(hex: bottom),
                   let vc = viewController as? TrueMoneyViewController {

                    vc.applyCardGradient(topColor: c1, bottomColor: c2)
                }

                // ===== ICONS =====
                if let hex = self.iconTintHex,
                   let tint = UIColor(hex: hex),
                   let vc = viewController as? TrueMoneyViewController {
                    vc.updateIconTint(color: tint, textColor: tint)
                }
                
                // ===== ICON BACKGROUND =====
                if let iconBgHex = self.iconBackgroundHex,
                   let iconBgColor = UIColor(hex: iconBgHex),
                   let vc = viewController as? TrueMoneyViewController {
                    vc.updateIconBackground(color: iconBgColor)
                }

                // ===== Background =====
                if let bgHex = self.backgroundColorHex {
                    viewController.view.backgroundColor = UIColor(hex: bgHex)
                    collectionView?.backgroundColor = UIColor(hex: bgHex)
                }
                
                // ===== LABELS TEXT COLOR =====
                if let textHex = self.buttonTextColorHex,
                   let textColor = UIColor(hex: textHex) {
                    labels.forEach { $0.textColor = textColor }
                }
                
                
                // ===== PAY NOW BUTTON =====
                if let btnBGHex = self.iconTintHex,
                   let bgColor = UIColor(hex: btnBGHex),
                   let textHex = self.buttonTextColorHex,
                   let textColor = UIColor(hex: textHex) {
                    themeButton?.backgroundColor = bgColor
                    themeButton?.setTitleColor(textColor, for: .normal)
                }
                
                // Optional: Login button styling
                if let login = loginButton {
                    login.backgroundColor = .white
                    login.setTitleColor(.red, for: .normal)
                }

            }

            // 🎨 DEFAULT THEME (BLUE)
            else {
                
                // Reset gradients
                (viewController as? TrueMoneyViewController)?
                    .applyHeaderGradient(topColor: UIColor(red: 60/255, green: 120/255, blue: 255/255, alpha: 1),
                                         bottomColor: UIColor(red: 120/255, green: 80/255, blue: 255/255, alpha: 1))
                
                (viewController as? TrueMoneyViewController)?
                    .applyCardGradient(topColor: UIColor(red: 120/255, green: 180/255, blue: 255/255, alpha: 1),
                                       bottomColor: UIColor(red: 80/255, green: 120/255, blue: 230/255, alpha: 1))
                
                // Reset icon tint to BLUE
                (viewController as? TrueMoneyViewController)?
                    .updateIconTint(color: UIColor(red: 70/255, green: 120/255, blue: 255/255, alpha: 1))

                // Reset buttons
                themeButton?.backgroundColor = .systemBlue
                themeButton?.setTitleColor(.white, for: .normal)

                loginButton?.backgroundColor = .systemBlue
                loginButton?.setTitleColor(.white, for: .normal)

                labels.forEach { $0.textColor = .black }
                
                viewController.view.backgroundColor = .white
                collectionView?.backgroundColor = .white

            }
        }
    }
}

extension Notification.Name {
    static let themeDidChange = Notification.Name("themeDidChange")
}
