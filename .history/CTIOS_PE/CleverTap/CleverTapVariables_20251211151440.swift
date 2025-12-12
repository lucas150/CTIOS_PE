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

    var headerTitle: String {
        return values?["headerTitle"] as? String ?? "AIA"   // <- default fallback
    }
    
    var appImages: [String: String] {   
        return values?["Icons_Images"] as? [String: String] ?? [:]
        




           "headerTitle": "Logo",
           "logo": "aia_white",

           "Icons_Images": [
               "login": "login_icon",
               "carInsurance": "car-inusrance",
               "healthInsurance": "Health_Insaurance",
               "lifeInsurance": "Life_Insauracne",
           ],

           "Challenges_Images": [
               "run": "aia_challeng_1",
               "yoga": "aia_challeng_2",
               "meditate": "aia_challeng_3",
           ],

           "Dashbaord_Images": [
               "payNow": "PayNow",
               "bills": "doc.text",
               "insurance": "shield",
               "electricity": "bolt.fill",
               "prepaid": "creditcard",

               "wallet": "wallet.pass",
               "home": "house.fill",
               "rewards": "gift.fill",
               "mobile": "phone.fill",
           ],

           "Cards_Image": [
               "cardBlack": "card_black"
           ],

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
