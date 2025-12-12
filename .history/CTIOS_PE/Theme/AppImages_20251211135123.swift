//
//  AppImages.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 11/12/25.
//


import UIKit

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








let var_dict_nested = CleverTap.sharedInstance()?.defineVar(name: "var_dict_complex", dictionary: [
    "headerTitle": "Logo",
    "logo": "aia_white",

    "Icons_Images":[
        "login": "login_icon",
        "carInsurance": "car-inusrance",
        "healthInsurance": "Health_Insaurance",
        "lifeInsurance": "Life_Insauracne"
    ] ,

    "Challenges_Images": {
        "run": "aia_challeng_1",
        "yoga": "aia_challeng_2",
        "meditate": "aia_challeng_3"
    }

    "Dashbaord_Images": {
        "payNow": "PayNow",

        "bills": "doc.text",
        "insurance": "shield",
        "electricity": "bolt.fill",
        "prepaid": "creditcard",

        "wallet": "wallet.pass",
        "home": "house.fill",
        "rewards": "gift.fill",
        "mobile": "phone.fill"
    }

    "Cards_Image":[
        "cardBlack": "card_black"
    ] ,

    "Home": {
        "carouselTitle": "", 
        "challengesTitle": "Challenges",
        "categoriesTitle": "Categories",

        "login": "Login",
        "dashboard": "Dashboard"
    }

    "ChallengeItems": {
        "run": "Run 5km",
        "yoga": "Yoga",
        "meditate": "Meditate"
    }

    "CategoryItems": {
        "carInsurance": "Car Insurance",
        "healthInsurance": "Health Insurance",
        "lifeInsurance": "Life Insurance"
    }

    "Dashboard": [
        "payNow": "Pay Now",

        "bills": "Bills",
        "insurance": "Insurance",
        "electricity": "Electricity",
        "prepaid": "Prepaid",

        "wallet": "Wallet",
        "home": "Home",
        "rewards": "Rewards",
        "mobile": "Mobile"
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

            "subtitleFont":16,
            "subtitleFont_weight": "medium",

            "bodyFont":14,
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

            "subtitleFont":16,
            "subtitleFont_weight": "medium",

            "bodyFont":14,
            "bodyFont_weight": "regular",

            "smallFont": 12,
            "smallFont_weight": "regular",

            "buttonFont": 16,
            "buttonFont_weight": "semibold",

        ]
    ])
