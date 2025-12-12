//
//  AppImages.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 11/12/25.
//


import UIKit
import CleverTapSDK


enum AppImages {
    

    static var logo: UIImage? {
        UIImage(named: CleverTapVariables.shared.logo)
    }

//    static let logo = UIImage(named: "aia_white")



    enum Icons {
        static var login : UIImage? {UIImage(named: CleverTapVariables.shared.login_image)}
        static var carInsurance : UIImage? {UIImage(named: CleverTapVariables.shared.carInsurance_image)}
        static var healthInsurance : UIImage? {UIImage(named: CleverTapVariables.shared.healthInsurance_image)}
        static var lifeInsurance : UIImage? {UIImage(named: CleverTapVariables.shared.lifeInsurance_image)}
    }

    enum Challenges {
        static var run : UIImage? {UIImage(named: CleverTapVariables.shared.run)}
        static var yoga : UIImage? {UIImage(named: CleverTapVariables.shared.yoga)}
        static var meditate : UIImage? {UIImage(named: CleverTapVariables.shared.meditate)}
    }
    
    enum TrueMoneyIcons {
        static var payNow : UIImage? {UIImage(named: "PayNow")}

        // You can replace these with real asset names
        static var bills : UIImage? {UIImage(systemName: "doc.text")}
        static var insurance : UIImage? {UIImage(systemName: "shield")}
        static var electricity : UIImage? {UIImage(systemName: "bolt.fill")}
        static var prepaid : UIImage? {UIImage(systemName: "creditcard")}

        static var wallet : UIImage? {UIImage(systemName: "wallet.pass")}
        static var home : UIImage? {UIImage(systemName: "house.fill")}
        static var rewards : UIImage? {UIImage(systemName: "gift.fill")}
        static let mobile : UIImage? {UIImage(systemName: "phone.fill")}
    }

    enum Cards {
        static let cardBlack : UIImage? {UIImage(named: "card_black")}
    }

}
