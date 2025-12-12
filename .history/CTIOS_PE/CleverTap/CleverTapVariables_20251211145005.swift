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

    // 🔥 This is your single shared variable.
    var peVariables: [String: Any]?

    // Load CleverTap variable once
    func loadPEVariables() {
        peVariables = CleverTap.sharedInstance()?.getVariableValue("PE_variable") as? [String: Any]
    }

}