//
//  InterfaceController.swift
//  WatchBump WatchKit Extension
//
//  Created by Michael DeWitt on 11/23/14.
//  Copyright (c) 2014 Michael DeWitt. All rights reserved.
//

import WatchKit
import Foundation

let categoryKey = "selectedCategory"

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var interfaceTable: WKInterfaceTable!
    
    let categories = ["Company", "Skills", "Friends", "Interests", "Groups", "Places"];
    let count = [0, 5, 20, 1, 4, 0]

    override init(context: AnyObject?) {
        // Initialize variables here.
        super.init(context: context)
        
        let data = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("Users", ofType: "plist")!)
        
        self.loadTableData()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }
    
    //MARK: TableView DataSource
    
    func loadTableData() {
        self.interfaceTable.setNumberOfRows(self.categories.count, withRowType: "default");
        
        for (index, value) in enumerate(self.categories) {
            if let row = self.interfaceTable.rowControllerAtIndex(index) as? InterestTableRowController {
                
                let count = self.count[index]
                row.label.setText(value)
                row.countLabel.setText("\(count)")
            }
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        
        let catg = self.categories[rowIndex]
        let image = UIImage(named: "ProfilePicture")

        let userInfo = User(name: "Test", type: catg, company: "Hackathon", picture: image!)
        
        [categoryKey : catg]
        
        var controllers: [String] = []
        var users: [User] = []
        
        for _ in self.categories {
            controllers += ["ProfileViewController"]
            users += [userInfo]
        }
        
        self.presentControllerWithNames(controllers, contexts: users)
    }

}
