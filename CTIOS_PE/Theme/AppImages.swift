//
//  AppImages.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 11/12/25.
//

import UIKit
import CleverTapSDK

enum AppImages {

    // MARK: - Logo
    static var logo: UIImage? {
        UIImage.loadCTImage(CleverTapVariables.shared.logo)
    }

    // MARK: - Icons
    enum Icons {
        static var login: UIImage? {
            UIImage.loadCTImage(CleverTapVariables.shared.login_icon)
        }
        static var carInsurance: UIImage? {
            UIImage.loadCTImage(CleverTapVariables.shared.carInsurance_icon)
        }
        static var healthInsurance: UIImage? {
            UIImage.loadCTImage(CleverTapVariables.shared.healthInsurance_icon)
        }
        static var lifeInsurance: UIImage? {
            UIImage.loadCTImage(CleverTapVariables.shared.lifeInsurance_icon)
        }
    }

    // MARK: - Challenges
    enum Challenges {
        static var run: UIImage? {
            UIImage.loadCTImage(CleverTapVariables.shared.challenge_run_img)
        }
        static var yoga: UIImage? {
            UIImage.loadCTImage(CleverTapVariables.shared.challenge_yoga_img)
        }
        static var meditate: UIImage? {
            UIImage.loadCTImage(CleverTapVariables.shared.challenge_meditate_img)
        }
    }

    // MARK: - Dashboard
    enum DashboardIcons {
        static var payNow: UIImage? {
            UIImage.loadCTImage(CleverTapVariables.shared.db_payNow_img)
        }
        static var bills: UIImage? {
            UIImage.loadCTImage(CleverTapVariables.shared.db_bills_img)
        }
        static var insurance: UIImage? {
            UIImage.loadCTImage(CleverTapVariables.shared.db_insurance_img)
        }

        static var electricity: UIImage? {
            UIImage.loadCTImage(CleverTapVariables.shared.db_electricity_img)
            
        }
        static var prepaid: UIImage? {
            UIImage.loadCTImage(CleverTapVariables.shared.db_prepaid_img)
        }
        static var wallet: UIImage? {
            UIImage.loadCTImage(CleverTapVariables.shared.db_wallet_img)
        }
        static var home: UIImage? {
            UIImage.loadCTImage(CleverTapVariables.shared.db_home_img)
        }
        static var rewards: UIImage? {
            UIImage.loadCTImage(CleverTapVariables.shared.db_rewards_img)
        }
        static var mobile: UIImage? {
            UIImage.loadCTImage(CleverTapVariables.shared.db_mobile_img)
        }
    }

    // MARK: - Cards
    enum Cards {
        static var cardBlack: UIImage? {
            UIImage.loadCTImage(CleverTapVariables.shared.cardBlack_img)
        }
    }
}
