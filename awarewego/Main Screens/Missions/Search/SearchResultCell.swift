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

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch began")
        self.resultButton.isSelected = !self.resultButton.isSelected
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch cancel")
        self.resultButton.isSelected = !self.resultButton.isSelected
        super.touchesCancelled(touches, with: event)
    }
    
}
