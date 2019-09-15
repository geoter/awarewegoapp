//
//  CustomPage.swift
//  SwiftyOnboardExample
//
//  Created by Jay on 3/27/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit

struct OnboardPageModel {
    var title: String = ""
    var subtitle: String = ""
    var textColor: UIColor = UIColor.white
    var image: UIImage = UIImage()
    var bgColor_bottom: UIColor = UIColor.white
    var bgColor_top: UIColor = UIColor.white
}

class OnboardPage: SwiftyOnboardPage {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var bottom_backgroundView: UIView!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "OnboardPage", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func configure(pageModel:OnboardPageModel) {
        image.image = pageModel.image
        
        let firstWord = pageModel.title.components(separatedBy: " ").first
        let restSentence = pageModel.title.components(separatedBy: " ")[1...].joined(separator: " ")
        
        let attributedText = NSMutableAttributedString(string: firstWord!, attributes: [NSAttributedString.Key.font: UIFont(name: "Poppins-ExtraBold", size: 24)!])
        attributedText.append(NSAttributedString(string: " "))
        attributedText.append(NSAttributedString(string: restSentence, attributes: [NSAttributedString.Key.font: UIFont(name: "Poppins-Regular", size: 24)!]))
        
        titleLabel.attributedText = attributedText
        subTitleLabel.text = pageModel.subtitle
        
        titleLabel.textColor = pageModel.textColor
        subTitleLabel.textColor = pageModel.textColor
        
        setTopHalfColor(color:pageModel.bgColor_top)
        setBottomHalfColor(color: pageModel.bgColor_bottom)
    }
    
    private func setTopHalfColor(color:UIColor){
        self.backgroundColor = color
    }
    
    private func setBottomHalfColor(color:UIColor){
        bottom_backgroundView.backgroundColor = color
    }
}
