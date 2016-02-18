//
//  ViewController.swift
//  Warg
//
//  Created by Iman Zarrabian on 01/07/2016.
//  Copyright (c) 2016 Iman Zarrabian. All rights reserved.
//

import UIKit
import Warg

class ViewController: UIViewController {

    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var backgroundIV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePicture(self.refreshButton)
    }

    @IBAction func updatePicture(sender: UIButton) {
        let random = arc4random() % 4
        let imageName = "\(random)"
        self.backgroundIV.image = UIImage(named: imageName)
        self.view.layoutIfNeeded()
        
        if let madeColor = self.backgroundIV.firstReadbleColorInRect(self.refreshButton.frame, preferredColor: UIColor.redColor(), strategy: .ColorMatchingStrategyLinear) {
            
            self.refreshButton.tintColor = madeColor
        }
        else {
            self.refreshButton.tintColor = UIColor.redColor()
        }
    }
}

