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
    
    // MARK: - Root Level
    
    var headerTitle: String {
        return values?["headerTitle"] as? String ?? "Logo"
    }
    
    var logo: String {
        return values?["logo"] as? String ?? "aia_white"
    }
    
    // MARK: - Icons_Images
    
    private var icons: [String: String] {
        return values?["Icons_Images"] as? [String: String] ?? [:]
    }
    
    var login_icon: String { icons["login"] ?? "login_icon" }
    var carInsurance_icon: String { icons["carInsurance"] ?? "car-inusrance" }
    var healthInsurance_icon: String { icons["healthInsurance"] ?? "Health_Insaurance" }
    var lifeInsurance_icon: String { icons["lifeInsurance"] ?? "Life_Insauracne" }
    
    // MARK: - Challenges_Images
    
    private var challengeImages: [String: String] {
        return values?["Challenges_Images"] as? [String: String] ?? [:]
    }
    
    var challenge_run_img: String { challengeImages["run"] ?? "aia_challeng_1" }
    var challenge_yoga_img: String { challengeImages["yoga"] ?? "aia_challeng_2" }
    var challenge_meditate_img: String { challengeImages["meditate"] ?? "aia_challeng_3" }
    
    // MARK: - Dashboard_Images
    
    private var dashboardImages: [String: String] {
        return values?["Dashbaord_Images"] as? [String: String] ?? [:]
    }
    
    var db_payNow_img: String { dashboardImages["payNow"] ?? "PayNow" }
    var db_bills_img: String { dashboardImages["bills"] ?? "doc.text" }
    var db_insurance_img: String { dashboardImages["insurance"] ?? "shield" }
    
    var db_electricity_img: String { dashboardImages["electricity"] ?? "bolt.fill" }
    var db_prepaid_img: String { dashboardImages["prepaid"] ?? "creditcard" }
    var db_wallet_img: String { dashboardImages["wallet"] ?? "wallet.pass" }
    var db_home_img: String { dashboardImages["home"] ?? "house.fill" }
    var db_rewards_img: String { dashboardImages["rewards"] ?? "gift.fill" }
    var db_mobile_img: String { dashboardImages["mobile"] ?? "phone.fill" }
    
    // MARK: - Cards
    
    private var cards: [String: String] {
        return values?["Cards_Image"] as? [String: String] ?? [:]
    }
    
    var cardBlack_img: String { cards["cardBlack"] ?? "card_black" }
    
    // MARK: - Home Strings
    
    private var home: [String: String] {
        return values?["Home"] as? [String: String] ?? [:]
    }
    
    var home_carousel_title: String { home["carouselTitle"] ?? "" }
    var home_challenges_title: String { home["challengesTitle"] ?? "Challenges" }
    var home_categories_title: String { home["categoriesTitle"] ?? "Categories" }
    var home_login_title: String { home["login"] ?? "Login" }
    var home_dashboard_title: String { home["dashboard"] ?? "Dashboard" }
    
    // MARK: - ChallengeItems (Strings)
    
    private var challengeItems: [String: String] {
        return values?["ChallengeItems"] as? [String: String] ?? [:]
    }
    
    var challenge_run_title: String { challengeItems["run"] ?? "Run 5km" }
    var challenge_yoga_title: String { challengeItems["yoga"] ?? "Yoga" }
    var challenge_meditate_title: String { challengeItems["meditate"] ?? "Meditate" }
    
    // MARK: - CategoryItems
    
    private var categoryItems: [String: String] {
        return values?["CategoryItems"] as? [String: String] ?? [:]
    }
    
    var cat_carInsurance_title: String { categoryItems["carInsurance"] ?? "Car Insurance" }
    var cat_healthInsurance_title: String { categoryItems["healthInsurance"] ?? "Health Insurance" }
    var cat_lifeInsurance_title: String { categoryItems["lifeInsurance"] ?? "Life Insurance" }
    
    // MARK: - Dashboard (Text)
    
    private var dashboardText: [String: String] {
        return values?["Dashboard"] as? [String: String] ?? [:]
    }
    
    var db_payNow_title: String { dashboardText["payNow"] ?? "Pay Now" }
    var db_bills_title: String { dashboardText["bills"] ?? "Bills" }
    var db_insurance_title: String { dashboardText["insurance"] ?? "Insurance" }
    var db_electricity_title: String { dashboardText["electricity"] ?? "Electricity" }
    var db_prepaid_title: String { dashboardText["prepaid"] ?? "Prepaid" }
    var db_wallet_title: String { dashboardText["wallet"] ?? "Wallet" }
    var db_home_title: String { dashboardText["home"] ?? "Home" }
    var db_rewards_title: String { dashboardText["rewards"] ?? "Rewards" }
    var db_mobile_title: String { dashboardText["mobile"] ?? "Mobile" }
    
    // MARK: - DarkTheme
    
    private var darkTheme: [String: Any] {
        return values?["DarkTheme"] as? [String : Any] ?? [:]
    }
    
    var dark_primary: String { darkTheme["primary"] as? String ?? "#FF4E4E" }
    var dark_background: String { darkTheme["background"] as? String ?? "#121212" }
    var dark_cardBackground: String { darkTheme["cardBackground"] as? String ?? "#1E1E1E" }
    var dark_textPrimary: String { darkTheme["textPrimary"] as? String ?? "#FFFFFF" }
    var dark_textSecondary: String { darkTheme["textSecondary"] as? String ?? "#B3B3B3" }
    var dark_border: String { darkTheme["border"] as? String ?? "#333333" }
    
    var dark_headerFont: Int { darkTheme["headerFont"] as? Int ?? 22 }
    var dark_headerFont_weight: String { darkTheme["headerFont_weight"] as? String ?? "bold" }
    
    var dark_titleFont: Int { darkTheme["titleFont"] as? Int ?? 18 }
    var dark_titleFont_weight: String { darkTheme["titleFont_weight"] as? String ?? "semibold" }
    
    var dark_subtitleFont: Int { darkTheme["subtitleFont"] as? Int ?? 16 }
    var dark_subtitleFont_weight: String { darkTheme["subtitleFont_weight"] as? String ?? "medium" }
    
    var dark_bodyFont: Int { darkTheme["bodyFont"] as? Int ?? 14 }
    var dark_bodyFont_weight: String { darkTheme["bodyFont_weight"] as? String ?? "regular" }
    
    var dark_smallFont: Int { darkTheme["smallFont"] as? Int ?? 12 }
    var dark_smallFont_weight: String { darkTheme["smallFont_weight"] as? String ?? "regular" }
    
    var dark_buttonFont: Int { darkTheme["buttonFont"] as? Int ?? 16 }
    var dark_buttonFont_weight: String { darkTheme["buttonFont_weight"] as? String ?? "semibold" }
    
    // MARK: - LightTheme
    
    private var lightTheme: [String: Any] {
        return values?["LightTheme"] as? [String : Any] ?? [:]
    }
    
    var light_primary: String { lightTheme["primary"] as? String ?? "#D8242A" }
    var light_background: String { lightTheme["background"] as? String ?? "#F7F7F7" }
    var light_cardBackground: String { lightTheme["cardBackground"] as? String ?? "#FFFFFF" }
    var light_textPrimary: String { lightTheme["textPrimary"] as? String ?? "#1A1A1A" }
    var light_textSecondary: String { lightTheme["textSecondary"] as? String ?? "#666666" }
    var light_border: String { lightTheme["border"] as? String ?? "#E5E5E5" }
    
    var light_headerFont: Int { lightTheme["headerFont"] as? Int ?? 22 }
    var light_headerFont_weight: String { lightTheme["headerFont_weight"] as? String ?? "bold" }
    
    var light_titleFont: Int { lightTheme["titleFont"] as? Int ?? 18 }
    var light_titleFont_weight: String { lightTheme["titleFont_weight"] as? String ?? "semibold" }
    
    var light_subtitleFont: Int { lightTheme["subtitleFont"] as? Int ?? 16 }
    var light_subtitleFont_weight: String { lightTheme["subtitleFont_weight"] as? String ?? "medium" }
    
    var light_bodyFont: Int { lightTheme["bodyFont"] as? Int ?? 14 }
    var light_bodyFont_weight: String { lightTheme["bodyFont_weight"] as? String ?? "regular" }
    
    var light_smallFont: Int { lightTheme["smallFont"] as? Int ?? 12 }
    var light_smallFont_weight: String { lightTheme["smallFont_weight"] as? String ?? "regular" }
    
    var light_buttonFont: Int { lightTheme["buttonFont"] as? Int ?? 16 }
    var light_buttonFont_weight: String { lightTheme["buttonFont_weight"] as? String ?? "semibold" }
    
    
    
    var lastLoadedCarousel: [String] = []


    func nativeBanner(for category: String, completion: @escaping ([String]) -> Void) {

        var urls: [String] = []

        let variableName = category

        guard let data = CleverTap.sharedInstance()?.getVariableValue(variableName) as? [String: Any] else {
            print("⚠️ Failed to load \(variableName) from CleverTap")
            completion([])
            return
        }

        let keys = [
            "\(category) Banner Image 1",
            "\(category) Banner Image 2",
            "\(category) Banner Image 3"
        ]

        for key in keys {
            if let urlString = data[key] as? String {
                urls.append(urlString)
            }
        }

        completion(urls)
    }

        // MARK: - IMAGE DOWNLOADER
        private func loadImage(from urlString: String?, completion: @escaping (UIImage?) -> Void) {
            guard let urlString,
                  let url = URL(string: urlString) else {
                completion(nil)
                return
            }

            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data, let image = UIImage(data: data) {
                    completion(image)
                } else {
                    completion(nil)
                }
            }.resume()
        }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func printAllVariables() {
        print("\n------ CleverTap Variables Debug ------")

        // Print raw dictionary
        if let values = values {
            print("\n🔹 ROOT DICTIONARY:")
            print(values)
        } else {
            print("\n⚠️ No CleverTap values found (values == nil)")
        }

        // Print individual sections in a readable format
        print("\n🔸 Root Level")
        print("headerTitle:", headerTitle)
        print("logo:", logo)

        print("\n🔸 Icons_Images")
        print("login_icon:", login_icon)
        print("carInsurance_icon:", carInsurance_icon)
        print("healthInsurance_icon:", healthInsurance_icon)
        print("lifeInsurance_icon:", lifeInsurance_icon)

        print("\n🔸 Challenges_Images")
        print("run:", challenge_run_img)
        print("yoga:", challenge_yoga_img)
        print("meditate:", challenge_meditate_img)

        print("\n🔸 Dashboard_Images")
        print("payNow:", db_payNow_img)
        print("bills:", db_bills_img)
        print("insurance:", db_insurance_img)
        print("electricity:", db_electricity_img)
        print("prepaid:", db_prepaid_img)
        print("wallet:", db_wallet_img)
        print("home:", db_home_img)
        print("rewards:", db_rewards_img)
        print("mobile:", db_mobile_img)

        print("\n🔸 Cards")
        print("cardBlack:", cardBlack_img)

        print("\n🔸 Home Titles")
        print("carousel:", home_carousel_title)
        print("challenges:", home_challenges_title)
        print("categories:", home_categories_title)
        print("login:", home_login_title)
        print("dashboard:", home_dashboard_title)

        print("\n🔸 Challenge Items")
        print("run:", challenge_run_title)
        print("yoga:", challenge_yoga_title)
        print("meditate:", challenge_meditate_title)

        print("\n🔸 Category Items")
        print("carInsurance:", cat_carInsurance_title)
        print("healthInsurance:", cat_healthInsurance_title)
        print("lifeInsurance:", cat_lifeInsurance_title)

        print("\n🔸 Dashboard Text")
        print("payNow:", db_payNow_title)
        print("bills:", db_bills_title)
        print("insurance:", db_insurance_title)
        print("electricity:", db_electricity_title)
        print("prepaid:", db_prepaid_title)
        print("wallet:", db_wallet_title)
        print("home:", db_home_title)
        print("rewards:", db_rewards_title)
        print("mobile:", db_mobile_title)

        print("\n🔸 Dark Theme")
        print("primary:", dark_primary)
        print("background:", dark_background)
        print("cardBackground:", dark_cardBackground)
        print("textPrimary:", dark_textPrimary)
        print("textSecondary:", dark_textSecondary)
        print("border:", dark_border)

        print("headerFont:", dark_headerFont, dark_headerFont_weight)
        print("titleFont:", dark_titleFont, dark_titleFont_weight)
        print("subtitleFont:", dark_subtitleFont, dark_subtitleFont_weight)
        print("bodyFont:", dark_bodyFont, dark_bodyFont_weight)
        print("smallFont:", dark_smallFont, dark_smallFont_weight)
        print("buttonFont:", dark_buttonFont, dark_buttonFont_weight)

        print("\n🔸 Light Theme")
        print("primary:", light_primary)
        print("background:", light_background)
        print("cardBackground:", light_cardBackground)
        print("textPrimary:", light_textPrimary)
        print("textSecondary:", light_textSecondary)
        print("border:", light_border)

        print("headerFont:", light_headerFont, light_headerFont_weight)
        print("titleFont:", light_titleFont, light_titleFont_weight)
        print("subtitleFont:", light_subtitleFont, light_subtitleFont_weight)
        print("bodyFont:", light_bodyFont, light_bodyFont_weight)
        print("smallFont:", light_smallFont, light_smallFont_weight)
        print("buttonFont:", light_buttonFont, light_buttonFont_weight)

        print("\n------ END DEBUG ------\n")
    }

    
}
