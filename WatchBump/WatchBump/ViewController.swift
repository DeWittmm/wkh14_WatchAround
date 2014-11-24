//
//  ViewController.swift
//  WatchBump
//
//  Created by Michael DeWitt on 11/23/14.
//  Copyright (c) 2014 Michael DeWitt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    
    var categories = ["Company", "Skills", "Friends", "Interests", "Groups", "Places"];
    
    override init() {
        super.init()
    }

    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.rowHeight = 44;
        table.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:WBSettingCell = tableView.dequeueReusableCellWithIdentifier("Setting") as WBSettingCell
        cell.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        
        cell.title.text = categories[indexPath.row]
        cell.toggle.tag = indexPath.row;
        
        cell.imageOfTitle.image = UIImage(named: categories[indexPath.row])
        return cell
    }
    
    @IBAction func switched(sender: AnyObject) {
        /*
        var sharedDefaults = NSUserDefaults(suiteName: "group.com.capitalone.Watch1");
        sharedDefaults?.setObject(sender.tag, forKey: "cat")
        sharedDefaults?.synchronize()
        */
        
    }
}

