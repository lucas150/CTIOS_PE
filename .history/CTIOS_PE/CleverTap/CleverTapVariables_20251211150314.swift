//
//  CleverTapVariables.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 11/12/25.
//

import CleverTapSDK
import UIKit

class CleverTapVariables {
    
    
    func fetchValues() {
        if let ctValues = CleverTap.sharedInstance()?.getVariableValue("PE_variable") as? [String: Any] {
            let logo = ctValues["logo"] as? String
            print("Logo:", logo ?? "nil")
        } else {
            print("PE_variable not found or invalid type")
        }
    }

}
