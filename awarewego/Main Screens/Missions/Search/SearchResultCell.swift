//
//  SearchResultCell.swift
//  awarewego
//
//  Created by awarewego on 02/10/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var resultButton: RoundButton!
    
    var resultText:String = ""{
        willSet{
            resultButton.setTitle(newValue, for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
        backView.layer.cornerRadius = 10
        backView.layer.borderWidth = 1
        backView.layer.borderColor = #colorLiteral(red: 0.8549019608, green: 0.8549019608, blue: 0.8784313725, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
