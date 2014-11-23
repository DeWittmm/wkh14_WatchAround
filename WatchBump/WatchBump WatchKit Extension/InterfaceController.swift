//
//  InterfaceController.swift
//  WatchBump WatchKit Extension
//
//  Created by Michael DeWitt on 11/23/14.
//  Copyright (c) 2014 Michael DeWitt. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var interfaceTable: WKInterfaceTable!
    
    let categories = ["Interests", "Work History", "..."];

    override init(context: AnyObject?) {
        // Initialize variables here.
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
    
    func loadTableData() {
        self.interfaceTable.setNumberOfRows(self.categories.count, withRowType: "default");
        
        for (index, value) in enumerate(self.categories) {
            if let row = self.interfaceTable.rowControllerAtIndex(index) as? InterestTableRowController {
                
                row.label.setText(value)
            }
        }
    }

}
