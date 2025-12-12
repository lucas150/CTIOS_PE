//
//  AppStrings.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 11/12/25.
//
enum AppStrings {

    // ROOT LEVEL
    static var headerTitle: String {
        CleverTapVariables.shared.headerTitle
    }

    // MARK: - Home
    enum Home {
        static var carouselTitle: String {
            CleverTapVariables.shared.home_carousel_title
        }
        static var challengesTitle: String {
            CleverTapVariables.shared.home_challenges_title
        }
        static var categoriesTitle: String {
            CleverTapVariables.shared.home_categories_title
        }
        static var login: String {
            CleverTapVariables.shared.home_login_title
        }
        static var dashboard: String {
            CleverTapVariables.shared.home_dashboard_title
        }
    }

    // MARK: - Challenge Items
    enum ChallengeItems {
        static var run: String {
            CleverTapVariables.shared.challenge_run_title
        }
        static var yoga: String {
            CleverTapVariables.shared.challenge_yoga_title
        }
        static var meditate: String {
            CleverTapVariables.shared.challenge_meditate_title
        }
    }

    // MARK: - Category Items
    enum CategoryItems {
        static var carInsurance: String {
            CleverTapVariables.shared.cat_carInsurance_title
        }
        static var healthInsurance: String {
            CleverTapVariables.shared.cat_healthInsurance_title
        }
        static var lifeInsurance: String {
            CleverTapVariables.shared.cat_lifeInsurance_title
        }
    }

    // MARK: - TrueMoney Dashboard Texts
    enum TrueMoney {
        static var payNow: String {
            CleverTapVariables.shared.db_payNow_title
        }
        static var bills: String {
            CleverTapVariables.shared.db_bills_title
        }
        static var insurance: String {
            CleverTapVariables.shared.db_insurance_title
        }
        static var electricity: String {
            CleverTapVariables.shared.db_electricity_title
        }
        static var prepaid: String {
            CleverTapVariables.shared.db_prepaid_title
        }
        static var wallet: String {
            CleverTapVariables.shared.db_wallet_title
        }
        static var home: String {
            CleverTapVariables.shared.db_home_title
        }
        static var rewards: String {
            CleverTapVariables.shared.db_rewards_title
        }
        static var mobile: String {
            CleverTapVariables.shared.db_mobile_title
        }
    }
}
