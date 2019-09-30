//
//  MissionCollectionViewCell.swift
//  awarewego
//
//  Created by awarewego on 29/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

class MissionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTxt: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 24
        self.layer.masksToBounds = true
    }
    
    func configureCell(viewModel:MissionCellModel?){
        if let model = viewModel{
            titleLabel.text = model.title
            descriptionTxt.text = model.description
        }
    }

}
