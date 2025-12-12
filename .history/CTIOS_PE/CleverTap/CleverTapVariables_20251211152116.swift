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
