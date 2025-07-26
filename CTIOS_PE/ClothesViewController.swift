//
//  ClothesViewController.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 26/07/25.
//

import UIKit
import CleverTapSDK

class ClothesViewController: UIViewController {

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let clothes = CleverTap.sharedInstance()?.getVariableValue("Clothes") as? [String: Any] {
            loadImage(from: clothes["Clothes Product 1"] as? String, into: img1)
            loadImage(from: clothes["Clothes Product 2"] as? String, into: img2)
            loadImage(from: clothes["Clothes Product 3"] as? String, into: img3)
            loadImage(from: clothes["Clothes Product 4"] as? String, into: img4)
            loadImage(from: clothes["Clothes Product 5"] as? String, into: img5)
            loadImage(from: clothes["Clothes Product 6"] as? String, into: img6)
        } else {
            print("Failed to fetch Beauty data from CleverTap")
        }
    }

}
