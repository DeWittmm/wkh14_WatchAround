//
//  User.swift
//  WatchBump
//
//  Created by Michael DeWitt on 11/23/14.
//  Copyright (c) 2014 Michael DeWitt. All rights reserved.
//

import UIKit

class User: NSObject {
 
    let name: String
    let type: String
    var company: String?
    let picture: UIImage?
    let place: String
    
    init(name: String, type: String, company: String, picture: UIImage?, place: String) {
        self.name = name;
        self.type = type
        self.company = company
        self.picture = picture
        self.place = place
    }
}
