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
    
    @IBOutlet weak var nameLabel: WKInterfaceLabel!
    @IBOutlet weak var infoLabel: WKInterfaceLabel!
    
    let user: User?
    
    override init(context: AnyObject?) {
       
        user = context as? User
        println("Loaded ProfileVC for \(user)")
        
        super.init(context: context)
    }
    
    override func willActivate() {
        nameLabel.setText(user?.name)
        infoLabel.setText(user?.company)

        imageView.setImage(user?.picture)
    }
}
