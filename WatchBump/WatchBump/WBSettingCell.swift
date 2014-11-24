//
//  WBSettingCell.swift
//  WatchBump
//
//  Created by Quinton Petty on 11/23/14.
//  Copyright (c) 2014 Michael DeWitt. All rights reserved.
//

import Foundation
import UIKit

class WBSettingCell: UITableViewCell {
    @IBOutlet weak var toggle: UISwitch!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageOfTitle: UIImageView!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //imageView?.frame = CGRectMake(2.0, 2.0, 32.0, 32.0);
    }

}
