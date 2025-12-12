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
        static let run : UIImage? {UIImage(named: CleverTapVariables.shared.run)}
        static let yoga : UIImage? {UIImage(named: CleverTapVariables.shared.yoga)}
        static let meditate : UIImage? {UIImage(named: CleverTapVariables.shared.meditate)}
    }
    
    enum TrueMoneyIcons {
        static let payNow = UIImage(named: "PayNow")

        // You can replace these with real asset names
        static let bills = UIImage(systemName: "doc.text")
        static let insurance = UIImage(systemName: "shield")
        static let electricity = UIImage(systemName: "bolt.fill")
        static let prepaid = UIImage(systemName: "creditcard")

        static let wallet = UIImage(systemName: "wallet.pass")
        static let home = UIImage(systemName: "house.fill")
        static let rewards = UIImage(systemName: "gift.fill")
        static let mobile = UIImage(systemName: "phone.fill")
    }

    enum Cards {
        static let cardBlack = UIImage(named: "card_black")
    }

}
