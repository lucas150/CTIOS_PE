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

    var Dashbaord_Images: [String: String] {
        return values?["Dashbaord_Images"] as? [String: String] ?? [:]
    }

    var payNow: String {
        return values?["Dashbaord_Images.payNow"] as? String ?? "PayNow"
    }   // <- default fallback

    var bills: String {
        return values?["Dashbaord_Images.bills"] as? String ?? "doc.text"
    }   // <- default fallback
    var insurance: String {
        return values?["Dashbaord_Images.insurance"] as? String ?? "shield"
    }   // <- default fallback
    var electricity: String {
        return values?["Dashbaord_Images.electricity"] as? String ?? "
bolt.fill"
    }   // <- default fallback
    var prepaid: String {
        return values?["Dashbaord_Images.prepaid"] as? String ?? "creditcard"
    }   // <- default fallback      

   

    var wallet: String {
        return values?["Dashbaord_Images.wallet"] as? String ?? "wallet.pass"
    }   // <- default fallback
    var home: String {
        return values?["Dashbaord_Images.home"] as? String ?? "house.fill"
    }   // <- default fallback
    var rewards: String {
        return values?["Dashbaord_Images.rewards"] as? String ?? "gift.fill"
    }   // <- default fallback
    var mobile: String {        
        return values?["Dashbaord_Images.mobile"] as? String ?? "phone.fill"
    }   // <- default fallback
    
    var Cards_Image: [String: String] {
        return values?["Cards_Image"] as? [String: String] ?? [:]
    }
    var cardBlack: String {
        return values?["Cards_Image.cardBlack"] as? String ?? "card_black"
    }   // <- default fallback

   
}
