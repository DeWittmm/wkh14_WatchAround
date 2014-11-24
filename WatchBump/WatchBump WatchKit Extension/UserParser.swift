//
//  UserParser.swift
//  WatchBump
//
//  Created by Michael DeWitt on 11/23/14.
//  Copyright (c) 2014 Michael DeWitt. All rights reserved.
//

import UIKit

class UserParser: NSObject {
    
    var categories = ["Investor", "Designer", "Places", "Interests", "Groups"]
    var count = [3, 3, 0, 0, 0, 0]
    var users: [User] = []
    
    override init() {
        
        let data = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("Users", ofType: "plist")!)
        
        let userData = data?.firstObject as [[String: AnyObject]]
        
        for dict: [String: AnyObject] in userData {
            let firstName = dict["firstName"] as? String ?? ""
            let lastName = dict["lastName"] as? String ?? ""
            
            let name = "\(firstName) \(lastName)"
            let indus = dict["industry"] as? String ?? ""
            let location = dict["location"] as? String ?? ""
            let compy = dict["company"] as? String ?? ""
            
            let picture = UIImage(named: name)
            let user = User(name: name, type: indus, company: compy, picture: picture, place: location)
            
            users += [user]
        }
        
        for (index, value) in enumerate(categories) {
            let filteredUsers = users.filter {
                $0.type == value
            }
            count[index] = filteredUsers.count
        }
    }
}
