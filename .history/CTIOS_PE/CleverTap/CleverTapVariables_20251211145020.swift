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

    var peVariables: [String: Any]?

    func loadPEVariables() {
        peVariables = CleverTap.sharedInstance()?.getVariableValue("PE_variable") as? [String: Any]
    }
    let headerTitle = CleverTapVariables.shared.peVariables?["headerTitle"] as? String
swift
Copy code


}