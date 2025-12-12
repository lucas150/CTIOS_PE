//
//  CleverTapVariables.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 11/12/25.
//

import CleverTapSDK
import UIKit

class CleverTapVariables {
    
    
    static let shared = CleverTapVariables()
    
    
    private lazy var values: [String: Any]? = {
        CleverTap.sharedInstance()?.getVariableValue("PE_variable") as? [String: Any]
    }()
    
    var logo: String {
        return values?["logo"] as? String ?? "aia_white1"   // <- default fallback
    }
    
    var icons: [String: String] {
        return values?["Icons_Images"] as? [String: String] ?? [:]
    }
    
    var login_image: String {
        return values?["Icons_Images.login"] as? String ?? "login_icon"   // <- default fallback
    }
    
    var carInsurance_image: String {
        return values?["Icons_Images.carInsurance"] as? String ?? "car-inusrance"   // <- default fallback
    }
    
    var healthInsurance_image: String {
        return values?["Icons_Images.healthInsurance"] as? String ?? "Health_Insaurance"   // <- default fallback
    }
    
    var lifeInsurance_image: String {
        return values?["Icons_Images.lifeInsurance"] as? String ?? "Life_Insauracne"   // <- default fallback
    }


//   "Challenges_Images": [
//                "run": "aia_challeng_1",
//                "yoga": "aia_challeng_2",
//                "meditate": "aia_challeng_3",
//            ],
//
//            "Dashbaord_Images": [
//                "payNow": "PayNow",
//                "bills": "doc.text",
//                "insurance": "shield",
//                "electricity": "bolt.fill",
//                "prepaid": "creditcard",
//
//                "wallet": "wallet.pass",
//                "home": "house.fill",
//                "rewards": "gift.fill",
//                "mobile": "phone.fill",
//            ],
//
//            "Cards_Image": [
//                "cardBlack": "card_black"
//            ],


var Challenges_Images: [String: String] {
        return values?["Challenges_Images"] as? [String: String] ?? [:]
    }
    
    var run: String {
        return values?["Challenges_Images.run"] as? String ?? "aia_challeng_1"   // <- default fallback
    }

    var yoga: String {
        return values?["Challenges_Images.yoga"] as? String ?? "aia_challeng_2"   // <- default fallback
    }

    var meditate: String {
        return values?["Challenges_Images.meditate"] as? String ?? "aia_challeng_3"   // <- default fallback
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
