//
//  MissionTableViewCell.swift
//  awarewego
//
//  Created by awarewego on 02/10/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

class MissionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTxt: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var insetsView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) {
        insetsView.layer.cornerRadius = 24
        insetsView.layer.masksToBounds = true
        insetsView.backgroundColor = UIColor.blue
    }
    
    func configureCell(viewModel:MissionCellViewModel?){
        if let model = viewModel{
            titleLabel.text = model.title
            descriptionTxt.text = model.description
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
