////
////  ThemeManager.swift
////  CTIOS_PE
////
//
//import UIKit
//import CleverTapSDK
//
//class ThemeManager {
//    static let shared = ThemeManager()
//    
//    private(set) var isChristmasThemeApplied = false
//    
//    // Default elements
//    
//    private var backgroundColorHex: String?
//    private var SecondaryBackgroundColor: String?
//    private var buttonTextColorHex: String?
//    // TRUE MONEY Customizable Elements
//    var headerGradientTopHex: String?
//    var headerGradientBottomHex: String?
//    var cardGradientTopHex: String?
//    var cardGradientBottomHex: String?
//    var iconTintHex: String?
//    var viewBackgroundHex: String? = "#FFFFFF"   // main view background
//    var appBackgroundHex: String? = "#FFFFFF"
//    // scroll / container view bg
//
//
//
//    private init() {
//        loadThemeFromCleverTap()
//    }
//    
//    
//    // MARK: - Load Theme (for now hardcoded)
//    func loadThemeFromCleverTap() {
//
//        // ⚠️ KEEP DEFAULT COLORS FROM CLEVERTAP IF AVAILABLE
//        if let Christmas_Theme = CleverTap.sharedInstance()?.getVariableValue("Christmas Theme") as? [String: Any] {
//            
//            backgroundColorHex = Christmas_Theme["PrimaryBackgroundColor"] as? String
//            SecondaryBackgroundColor = Christmas_Theme["SecondaryBackgroundColor"] as? String
//
//            
//
////            buttonBackgroundColorHex = Christmas_Theme["backgroundColorHex 2"] as? String
//            buttonTextColorHex = Christmas_Theme["buttonTextColorHex 3"] as? String
//            
//            // Header gradient → red shades
//            headerGradientTopHex = Christmas_Theme["headerGradientTopHex"] as? String
//            headerGradientBottomHex = Christmas_Theme["headerGradientTopHex"] as? String
//            
//            // Card gradient → soft red
//            cardGradientTopHex = Christmas_Theme["cardGradientTopHex"] as? String
//            cardGradientBottomHex = Christmas_Theme["cardGradientBottomHex"] as? String
//
//            // Icon tint → strong red
//            iconTintHex = Christmas_Theme["iconTintHex"] as? String
//
//
//        }
//
//    }
//    
//    
//    // MARK: - Toggle Theme
//    func toggleTheme() {
//        isChristmasThemeApplied.toggle()
//        NotificationCenter.default.post(name: .themeDidChange, object: nil)
//    }
//
//    
//    // MARK: - Apply Theme
//    func applyTheme(
//        to viewController: UIViewController,
//        collectionView: UICollectionView? = nil,
//        themeButton: UIButton? = nil,
//        loginButton: UIButton? = nil,
//        labels: [UILabel] = []
//    ) {
//        
//        UIView.animate(withDuration: 0.3) {
//            
//            // 🎄 CHRISTMAS THEME ON
//            if self.isChristmasThemeApplied {
//
//                // ===== GRADIENTS =====
//                if let top = self.headerGradientTopHex,
//                   let bottom = self.headerGradientBottomHex,
//                   let c1 = UIColor(hex: top),
//                   let c2 = UIColor(hex: bottom),
//                   let vc = viewController as? TrueMoneyViewController {
//
//                    vc.applyHeaderGradient(topColor: c1, bottomColor: c2)
//                }
//
//                if let top = self.cardGradientTopHex,
//                   let bottom = self.cardGradientBottomHex,
//                   let c1 = UIColor(hex: top),
//                   let c2 = UIColor(hex: bottom),
//                   let vc = viewController as? TrueMoneyViewController {
//
//                    vc.applyCardGradient(topColor: c1, bottomColor: c2)
//                }
//
//                // ===== ICONS =====
//                if let hex = self.iconTintHex,
//                   let tint = UIColor(hex: hex),
//                   let vc = viewController as? TrueMoneyViewController {
//                    vc.updateIconTint(color: tint,textColor: tint)
//                }
//
//                // ===== Background =====
//                if let bgHex = self.backgroundColorHex {
//                    viewController.view.backgroundColor = UIColor(hex: bgHex)
//                    collectionView?.backgroundColor = UIColor(hex: bgHex)
//                }
//                
//                
//                // ===== PAY NOW BUTTON =====
//                if let btnBGHex = self.iconTintHex,
//                   let bgColor = UIColor(hex: btnBGHex),
//                   let textHex = self.buttonTextColorHex,
//                   let textColor = UIColor(hex: textHex) {
//                    themeButton?.backgroundColor = bgColor
//                    themeButton?.setTitleColor(textColor, for: .normal)
//                }
//                
//                // Optional: Login button styling
//                if let login = loginButton {
//                    login.backgroundColor = .white
//                    login.setTitleColor(.red, for: .normal)
//                }
//
//            }
//
//            // 🎨 DEFAULT THEME (BLUE)
//            else {
//                
//                // Reset gradients
//                (viewController as? TrueMoneyViewController)?
//                    .applyHeaderGradient(topColor: UIColor(red: 60/255, green: 120/255, blue: 255/255, alpha: 1),
//                                         bottomColor: UIColor(red: 120/255, green: 80/255, blue: 255/255, alpha: 1))
//                
//                (viewController as? TrueMoneyViewController)?
//                    .applyCardGradient(topColor: UIColor(red: 120/255, green: 180/255, blue: 255/255, alpha: 1),
//                                       bottomColor: UIColor(red: 80/255, green: 120/255, blue: 230/255, alpha: 1))
//                
//                // Reset icon tint to BLUE
//                (viewController as? TrueMoneyViewController)?
//                    .updateIconTint(color: UIColor(red: 70/255, green: 120/255, blue: 255/255, alpha: 1))
//
//                // Reset buttons
//                themeButton?.backgroundColor = .systemBlue
//                themeButton?.setTitleColor(.white, for: .normal)
//
//                loginButton?.backgroundColor = .systemBlue
//                loginButton?.setTitleColor(.white, for: .normal)
//
//                labels.forEach { $0.textColor = .black }
//                
//                viewController.view.backgroundColor = .white
//                collectionView?.backgroundColor = .white
//
//            }
//        }
//    }
//}
//
//extension Notification.Name {
//    static let themeDidChange = Notification.Name("themeDidChange")
//}

//
//  ThemeManager.swift
//  CTIOS_PE
//

import UIKit
import CleverTapSDK

// MARK: - Theme Model (Reusable Across App)
struct Theme {
    var headerGradientTop: UIColor
    var headerGradientBottom: UIColor
    var headerTextColor: UIColor

    var cardGradientTop: UIColor
    var cardGradientBottom: UIColor

    var iconTint: UIColor
    var buttonTint: UIColor

    var background: UIColor
}

final class ThemeManager {

    static let shared = ThemeManager()

    // MARK: - Flags
    private(set) var isChristmasThemeApplied = false

    // MARK: - Raw hex values fetched from CleverTap
    private var backgroundColorHex: String?
    private var secondaryBackgroundHex: String?
    private var buttonTextColorHex: String?

    private var headerGradientTopHex: String?
    private var headerGradientBottomHex: String?

    private var cardGradientTopHex: String?
    private var cardGradientBottomHex: String?

    private var iconTintHex: String?

    private init() {
        loadThemeFromCleverTap()
    }

    // MARK: - Load Theme From CleverTap
    func loadThemeFromCleverTap() {
        guard let christmasTheme =
            CleverTap.sharedInstance()?.getVariableValue("Christmas Theme") as? [String: Any]
        else { return }

        backgroundColorHex = christmasTheme["PrimaryBackgroundColor"] as? String
        secondaryBackgroundHex = christmasTheme["SecondaryBackgroundColor"] as? String
        buttonTextColorHex = christmasTheme["buttonTextColorHex 3"] as? String

        headerGradientTopHex = christmasTheme["headerGradientTopHex"] as? String
        headerGradientBottomHex = christmasTheme["headerGradientBottomHex"] as? String

        cardGradientTopHex = christmasTheme["cardGradientTopHex"] as? String
        cardGradientBottomHex = christmasTheme["cardGradientBottomHex"] as? String

        iconTintHex = christmasTheme["iconTintHex"] as? String
    }

    // MARK: - Computed Current Theme
    var currentTheme: Theme {
        if isChristmasThemeApplied {

            return Theme(
                headerGradientTop: UIColor(hex: headerGradientTopHex ?? "#FF5B5B")!,
                headerGradientBottom: UIColor(hex: headerGradientBottomHex ?? "#E20000")!,
                headerTextColor: .white,

                cardGradientTop: UIColor(hex: cardGradientTopHex ?? "#FF8A8A")!,
                cardGradientBottom: UIColor(hex: cardGradientBottomHex ?? "#FF5B5B")!,

                iconTint: UIColor(hex: iconTintHex ?? "#FF5B5B")!,
                buttonTint: UIColor(hex: iconTintHex ?? "#FF5B5B")!,

                background: UIColor(hex: backgroundColorHex ?? "#FFFFFF")!
            )
        }

        // DEFAULT THEME (Blue)
        return Theme(
            headerGradientTop: UIColor(red: 60/255, green: 120/255, blue: 1, alpha: 1),
            headerGradientBottom: UIColor(red: 120/255, green: 100/255, blue: 255/255, alpha: 1),
            headerTextColor: .white,

            cardGradientTop: UIColor(red: 150/255, green: 180/255, blue: 255/255, alpha: 1),
            cardGradientBottom: UIColor(red: 100/255, green: 140/255, blue: 230/255, alpha: 1),

            iconTint: .systemBlue,
            buttonTint: .systemBlue,

            background: .white
        )
    }

    // MARK: - Toggle Theme
    func toggleTheme() {
        isChristmasThemeApplied.toggle()
        NotificationCenter.default.post(name: .themeDidChange, object: nil)
    }

    // MARK: - Apply Theme (Generic)
    func applyTheme(
        to vc: UIViewController,
        collectionView: UICollectionView? = nil,
        themeButton: UIButton? = nil,
        labels: [UILabel] = []
    ) {

        let theme = currentTheme

        UIView.animate(withDuration: 0.3) {

            vc.view.backgroundColor = theme.background
            collectionView?.backgroundColor = theme.background

            themeButton?.backgroundColor = theme.buttonTint
            themeButton?.setTitleColor(.white, for: .normal)

            labels.forEach { $0.textColor = theme.headerTextColor }
        }
    }
}


// MARK: - Notification for Theme Change
extension Notification.Name {
    static let themeDidChange = Notification.Name("themeDidChange")
}


// MARK: - Hex Color Helper
extension UIColor {
    convenience init?(hex: String) {
        var cleaned = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cleaned.hasPrefix("#") { cleaned.removeFirst() }
        guard cleaned.count == 6 else { return nil }

        var rgb: UInt64 = 0
        Scanner(string: cleaned).scanHexInt64(&rgb)

        self.init(
            red: CGFloat((rgb >> 16) & 0xFF) / 255,
            green: CGFloat((rgb >> 8) & 0xFF) / 255,
            blue: CGFloat(rgb & 0xFF) / 255,
            alpha: 1.0
        )
    }
}
