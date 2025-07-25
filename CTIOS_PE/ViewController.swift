//
//  ViewController.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 25/07/25.
//

import UIKit
import CleverTapSDK

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var OnUserLogin: UIButton!
    @IBOutlet weak var alertbutton: UIButton!
    

    override func viewDidLoad() {
        
        super.viewDidLoad()

                // Do any additional setup after loading the view.
    }
    
    @IBAction func OnUserLogin(_ sender: Any) {
   
        let profile: Dictionary<String, AnyObject> = [
            //Update pre-defined profile properties
            "name": "Aditya Gandhi" as AnyObject,
            "email": "aditya@gmail.com" as AnyObject,
            "identity": 77777878 as AnyObject,
            //Update custom profile properties
            "Plan type": "Silver" as AnyObject,
            "Favorite Food": "Pizza" as AnyObject,
        ]

        CleverTap.sharedInstance()?.onUserLogin(profile)
        
        
        
        
        let var_string = CleverTap.sharedInstance()?.defineVar(name: "var_string", string: "hello, world")
        let var_int = CleverTap.sharedInstance()?.defineVar(name: "var_int", integer: 10)
        let var_bool = CleverTap.sharedInstance()?.defineVar(name: "var_bool", boolean: true)
        let var_float = CleverTap.sharedInstance()?.defineVar(name: "var_float", float: 6.0)
        let var_double = CleverTap.sharedInstance()?.defineVar(name: "var_double", double: 60.999)
        let var_short = CleverTap.sharedInstance()?.defineVar(name: "var_short", short: 1)
        let var_number = CleverTap.sharedInstance()?.defineVar(name: "var_number", number: NSNumber(value: 32))
        let var_long = CleverTap.sharedInstance()?.defineVar(name: "var_long", long: 64)
        // Dictionary
        let var_dict = CleverTap.sharedInstance()?.defineVar(name: "var_dict", dictionary: [
              "nested_string": "hello, nested",
              "nested_double": 10.5
            ])

        let var_dict_nested = CleverTap.sharedInstance()?.defineVar(name: "var_dict_complex", dictionary: [
                "nested_int": 1,
                "nested_string": "hello, world",
                "nested_map": [
                    "nested_map_int": 15,
                    "nested_map_string": "hello, nested map",
                ]
            ])
        
        
        
        
        CleverTap.sharedInstance()?.syncVariables();
    }
    
    


    
}

