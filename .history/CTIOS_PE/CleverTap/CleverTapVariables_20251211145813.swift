//
//  CleverTapVariables.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 11/12/25.
//

import CleverTapSDK
import UIKit
import CleverTapSDK

class CleverTapVariables {

    static let shared = CleverTapVariables()   // ← CORRECT
    private init() {}

    var peVariables: [String: Any]?

    func loadPEVariables() {
        peVariables = CleverTap.sharedInstance()?.getVariableValue("PE_variable") as? [String: Any]
    }

    func string(for key: String) -> String? {
        return peVariables?[key] as? String
    }
}
