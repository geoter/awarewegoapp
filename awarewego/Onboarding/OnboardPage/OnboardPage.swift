//
//  CustomPage.swift
//  SwiftyOnboardExample
//
//  Created by Jay on 3/27/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
import SwiftyOnboard

struct OnboardPageModel {
    var title: String = ""
    var subtitle: String = ""
    var image: UIImage = UIImage()
    var bgColor: UIColor = UIColor.white
}

class OnboardPage: SwiftyOnboardPage {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "OnboardPage", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func configure(pageModel:OnboardPageModel) {
        image.image = pageModel.image
        titleLabel.text = pageModel.title
        subTitleLabel.text = pageModel.subtitle
        backgroundView.backgroundColor = pageModel.bgColor
    }
}
