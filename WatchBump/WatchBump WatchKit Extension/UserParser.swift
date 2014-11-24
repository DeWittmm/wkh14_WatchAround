//
//  UserParser.swift
//  WatchBump
//
//  Created by Michael DeWitt on 11/23/14.
//  Copyright (c) 2014 Michael DeWitt. All rights reserved.
//

import UIKit

protocol UpdatesDelegate {
    func userDefaultsDidChange()
}

//This would be specified by the credentials of the user
let matchCharacteristicsByCatg = ["Investors": ["Bessemer", "Angel Investments"],
                                  "Designers": ["Vieitez Designs","Boomtown", "Amini Designs"],
                                  "Places": ["NASA Ames"]]

class UserParser: NSObject {
    
    var delegate: UpdatesDelegate?
    var usersByCategory: [String: [User]] = ["Investors": [], "Designers": [], "Places": [], "Companies": [], "Groups": []]
    var categories: [String] = ["Investors", "Designers", "Places", "Groups"] {
        didSet {
            usersByCategory.removeAll(keepCapacity: true)
            for catg in categories {
                usersByCategory.updateValue([], forKey: catg)
            }
        }
    }
    
    private let sharedDefaults = NSUserDefaults(suiteName: "group.com.wkh14.WatchBump")
    
    override init() {
        super.init()
        
        getCategoriesFromUserDefaults()
        // Register for notification of changes in defaults
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "setupCategoriesFromUserDefaults", name: NSUserDefaultsDidChangeNotification, object: sharedDefaults)
        setupCategories()
    }
    
    func getCategoriesFromUserDefaults() {
        if let userCategories = sharedDefaults?.valueForKey("CategoriesKey") as? [String] {
            categories = userCategories
        }
    }
    
    func setupCategories() {
        let data = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("Users", ofType: "plist")!)!
        let json = JSON(data)
        
        //Bad file formatting
        if let userData = json.array?.first?.array {
            for userDict: JSON in userData {
                
                let firstName = userDict["firstName"].string ?? ""
                let lastName = userDict["lastName"].string ?? ""
                
                let fullName = "\(firstName) \(lastName)"
                let indus = userDict["industry"].string
                let location = userDict["location"].string
                let company = userDict["company"].string
                
                let picture = UIImage(named: fullName)
                
                let user = User(name: fullName, type: indus, company: company, picture: picture, place: location)
                
                for (catg, var users: [User]) in usersByCategory {
                    if let attribute = user.attributeBasedOnCategory(catg) {
                        if contains(matchCharacteristicsByCatg[catg] ?? [], attribute) {
                         users += [user]
                         usersByCategory.updateValue(users, forKey: catg)
                        }
                    }
                }
            }
        }
    }
    
    //MARK: Helpers
}
