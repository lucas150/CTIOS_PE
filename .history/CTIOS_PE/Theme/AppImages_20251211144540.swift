//
//  AppImages.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 11/12/25.
//


import UIKit
import CleverTapSDK


enum AppImages {


    static let logo = UIImage(named: "aia_white")

    enum Icons {
        static let login = UIImage(named: "login_icon")

        static let carInsurance = UIImage(named: "car-inusrance")
        static let healthInsurance = UIImage(named: "Health_Insaurance")
        static let lifeInsurance = UIImage(named: "Life_Insauracne")
    }

    enum Carousel {
        static let placeholder = UIImage(named: "carousel_placeholder")
    }

    enum Challenges {
        static let run = UIImage(named: "aia_challeng_1")
        static let yoga = UIImage(named: "aia_challeng_2")
        static let meditate = UIImage(named: "aia_challeng_3")
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
