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
    
    private init() {}
    
    func fetchPEVariables() -> [String: Any]? {
        if let peVariables = CleverTap.sharedInstance()?.getVariableValue("PE_variable") as? [String: Any] {
            // MARK: - Top Level
            let headerTitle = peVariables["headerTitle"] as? String
            let logo = peVariables["logo"] as? String
            prin
            return peVariables
        }
        return nil
    }
}