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
    
    let parser: UserParser
 
    override init(context: AnyObject?) {
        // Initialize variables here.
        
        parser = UserParser()
        super.init(context: context)
        
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
        self.interfaceTable.setNumberOfRows(parser.categories.count, withRowType: "default");
        
        for (index, key) in enumerate(parser.categories) {
            if let row = self.interfaceTable.rowControllerAtIndex(index) as? InterestTableRowController {
                
                let count = parser.usersByCategory[key]?.count
                row.countLabel.setText("\(count ?? 0)")
                row.label.setText(key)
            }
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        
        let catg = parser.categories[rowIndex]
        
        var controllers: [String] = []
        var contexts: [[String: User]] = []
        if let catgUsers = parser.usersByCategory[catg]{
            
            for user in catgUsers {
                controllers += ["ProfileViewController"]
                let dict = [catg : user]
                contexts += [dict]
            }
            
            presentControllerWithNames(controllers, contexts: contexts)
        }
    }

}
