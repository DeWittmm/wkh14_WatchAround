//
//  UserParser.swift
//  WatchBump
//
//  Created by Michael DeWitt on 11/23/14.
//  Copyright (c) 2014 Michael DeWitt. All rights reserved.
//

import UIKit

class UserParser: NSObject {
    
    var categories = ["Investor", "Designer", "Place", "Interest", "Group"]
    var count = [3, 3, 0, 0, 0, 0]
    var users: [User] = []
    
    override init() {
        
        let sharedDefaults = NSUserDefaults(suiteName: "group.com.capitalone.Watch1")
        
        // Register for notification of changes in defaults
//        [[NSNotificationCenter defaultCenter] addObserver:self
//        selector:@selector(defaultsChanged:)
//        name:NSUserDefaultsDidChangeNotification
//        object:self.sharedDefaults];
        
        let data = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("Users", ofType: "plist")!)
        let userData = data?.firstObject as [[String: AnyObject]]
        
        for dict: [String: AnyObject] in userData {
            let firstName = asString(dict["firstName"])
            let lastName = asString(dict["lastName"])
            
            let name = "\(firstName) \(lastName)"
            let indus = asString(dict["industry"])
            let location = asString(dict["location"])
            let compy = asString(dict["company"])
            
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

func asString(msg:AnyObject?) -> String {
    return msg as? String ?? ""
}
