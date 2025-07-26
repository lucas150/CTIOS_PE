//
//  SportsViewController.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 26/07/25.
//

import UIKit
import CleverTapSDK

class SportsViewController: UIViewController {

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let sports = CleverTap.sharedInstance()?.getVariableValue("Sports") as? [String: Any] {
            loadImage(from: sports["Sports Product 1"] as? String, into: img1)
            loadImage(from: sports["Sports Product 2"] as? String, into: img2)
            loadImage(from: sports["Sports Product 3"] as? String, into: img3)
            loadImage(from: sports["Sports Product 4"] as? String, into: img4)
            loadImage(from: sports["Sports Product 5"] as? String, into: img5)
            loadImage(from: sports["Sports Product 6"] as? String, into: img6)
        } else {
            print("Failed to fetch Beauty data from CleverTap")
        }
    }

}
