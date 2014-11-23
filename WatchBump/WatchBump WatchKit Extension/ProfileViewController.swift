//
//  ProfileViewController.swift
//  WatchBump
//
//  Created by Michael DeWitt on 11/23/14.
//  Copyright (c) 2014 Michael DeWitt. All rights reserved.
//

import UIKit
import WatchKit

class ProfileViewController: WKInterfaceController {
   
    @IBOutlet weak var imageView: WKInterfaceImage!
    @IBOutlet weak var infoLabel: WKInterfaceLabel!
    
    override init(context: AnyObject?) {
        super.init(context: context)
        
        if let context = context as? [String: String] {
            println("Loaded ProfileVC for \(context[categoryKey])")
        }
        
        imageView.setImage(UIImage(contentsOfFile: "ProfilePicture"))
    }
    
    override func willActivate() {
        
    }
}
