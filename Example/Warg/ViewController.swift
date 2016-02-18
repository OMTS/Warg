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
    var lastImageIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePicture(self.refreshButton)
    }
    
    @IBAction func updatePicture(sender: UIButton) {
        var random = arc4random() % 4
        while Int(random) == lastImageIndex {
            random = arc4random() % 4
        }
        lastImageIndex = Int(random)
        
        let imageName = "\(random)"
        self.backgroundIV.image = UIImage(named: imageName)
        self.view.layoutIfNeeded()
        
        do {
            if let madeColor = try self.backgroundIV.firstReadableColorInRect(self.refreshButton.frame, preferredColor: UIColor.redColor(), strategy: .ColorMatchingStrategyLinear) {
                
                self.refreshButton.tintColor = madeColor
            }
            else {
                self.refreshButton.tintColor = UIColor.redColor()
            }
        }
        catch Warg.WargError.InvalidBackgroundContent(let reason) {
            print(reason)
            self.refreshButton.tintColor = UIColor.redColor()
        }
        catch {
            print("generic error")
            
        }
    }
}

