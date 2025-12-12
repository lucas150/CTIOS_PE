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
        return values?["logo"] as? String ?? "aia_white1"   
    }
    
    var icons: [String: String] {
        return values?["Icons_Images"] as? [String: String] ?? [:]
    }
    
    var login_image: String {
        return values?["Icons_Images.login"] as? String ?? "login_icon"   
    }
    
    var carInsurance_image: String {
        return values?["Icons_Images.carInsurance"] as? String ?? "car-inusrance"   
    }
    
    var healthInsurance_image: String {
        return values?["Icons_Images.healthInsurance"] as? String ?? "Health_Insaurance"   
    }
    
    var lifeInsurance_image: String {
        return values?["Icons_Images.lifeInsurance"] as? String ?? "Life_Insauracne"   
    }

    var Challenges_Images: [String: String] {
        return values?["Challenges_Images"] as? [String: String] ?? [:]
    }
    
    var run: String {
        return values?["Challenges_Images.run"] as? String ?? "aia_challeng_1"   
    }

    var yoga: String {
        return values?["Challenges_Images.yoga"] as? String ?? "aia_challeng_2"   
    }

    var meditate: String {
        return values?["Challenges_Images.meditate"] as? String ?? "aia_challeng_3"   
    }

    var Dashbaord_Images: [String: String] {
        return values?["Dashbaord_Images"] as? [String: String] ?? [:]
    }

    var payNow: String {
        return values?["Dashbaord_Images.payNow"] as? String ?? "PayNow"
    }   

    var bills: String {
        return values?["Dashbaord_Images.bills"] as? String ?? "doc.text"
    }   
    var insurance: String {
        return values?["Dashbaord_Images.insurance"] as? String ?? "shield"
    }   
    var electricity: String {
        return values?["Dashbaord_Images.electricity"] as? String ?? "bolt.fill"
    }   
    var prepaid: String {
        return values?["Dashbaord_Images.prepaid"] as? String ?? "creditcard"
    }  

   

    var wallet: String {
        return values?["Dashbaord_Images.wallet"] as? String ?? "wallet.pass"
    }   
    var home: String {
        return values?["Dashbaord_Images.home"] as? String ?? "house.fill"
    }   
    var rewards: String {
        return values?["Dashbaord_Images.rewards"] as? String ?? "gift.fill"
    }   
    var mobile: String {        
        return values?["Dashbaord_Images.mobile"] as? String ?? "phone.fill"
    }   
    
    var Cards_Image: [String: String] {
        return values?["Cards_Image"] as? [String: String] ?? [:]
    }
    var cardBlack: String {
        return values?["Cards_Image.cardBlack"] as? String ?? "card_black1"
    }   

    var Home
   


      "Home": [
               "carouselTitle": "",
               "challengesTitle": "Challenges",
               "categoriesTitle": "Categories",

               "login": "Login",
               "dashboard": "Dashboard",
           ],

           "ChallengeItems": [
               "run": "Run 5km",
               "yoga": "Yoga",
               "meditate": "Meditate",
           ],

           "CategoryItems": [
               "carInsurance": "Car Insurance",
               "healthInsurance": "Health Insurance",
               "lifeInsurance": "Life Insurance",
           ],

           "Dashboard": [
               "payNow": "Pay Now",

               "bills": "Bills",
               "insurance": "Insurance",
               "electricity": "Electricity",
               "prepaid": "Prepaid",

               "wallet": "Wallet",
               "home": "Home",
               "rewards": "Rewards",
               "mobile": "Mobile",
           ],

           "DarkTheme": [

               "primary": "#FF4E4E",
               "background": "#121212",
               "cardBackground": "#1E1E1E",
               "textPrimary": "#FFFFFF",
               "textSecondary": "#B3B3B3",
               "border": "#333333",

               "headerFont": 22,
               "headerFont_weight": "bold",

               "titleFont": 18,
               "titleFont_weight": "semibold",

               "subtitleFont": 16,
               "subtitleFont_weight": "medium",

               "bodyFont": 14,
               "bodyFont_weight": "regular",

               "smallFont": 12,
               "smallFont_weight": "regular",

               "buttonFont": 16,
               "buttonFont_weight": "semibold",

           ],

           "LightTheme": [

               "primary": "#D8242A",
               "background": "#F7F7F7",
               "cardBackground": "#FFFFFF",
               "textPrimary": "#1A1A1A",
               "textSecondary": "#666666",
               "border": "#E5E5E5",

               "headerFont": 22,
               "headerFont_weight": "bold",

               "titleFont": 18,
               "titleFont_weight": "semibold",

               "subtitleFont": 16,
               "subtitleFont_weight": "medium",

               "bodyFont": 14,
               "bodyFont_weight": "regular",

               "smallFont": 12,
               "smallFont_weight": "regular",

               "buttonFont": 16,
               "buttonFont_weight": "semibold",

           ],
       ]
   )
}
