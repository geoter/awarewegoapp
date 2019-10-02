//
//  SectionCategoryHeader.swift
//  awarewego
//
//  Created by awarewego on 29/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

class SectionCategoryHeader: UITableViewHeaderFooterView {
    
    static let headerHeight:Float = 50
    
    static let reuseIdentifier = "SectionCategoryHeader"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
