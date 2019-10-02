//
//  MissionsCategoryHeader.swift
//  awarewego
//
//  Created by awarewego on 29/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

class MissionsCategoryHeader: UITableViewHeaderFooterView {
    
    static let headerHeight:Float = 50
    
    static let reuseIdentifier = "MissionsCategoryHeader"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
