//
//  CustomOverlay.swift
//  SwiftyOnboardExample
//
//  Created by Jay on 3/27/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
import SwiftyOnboard

struct OnboardOverlayStyle {
    var buttonBgColor: UIColor = UIColor.white
    var buttonTitleColor: UIColor = UIColor.white
}

class OnboardOverlay: SwiftyOnboardOverlay {
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var contentControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "OnboardOverlay", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func configure(loginButtonStyle:OnboardOverlayStyle,signUpButtonStyle:OnboardOverlayStyle){
        //Background colors
        logInButton.backgroundColor = loginButtonStyle.buttonBgColor
        signUpButton.backgroundColor = signUpButtonStyle.buttonBgColor
        //Text colors
        logInButton.setTitleColor(loginButtonStyle.buttonTitleColor, for: .normal)
        signUpButton.setTitleColor(signUpButtonStyle.buttonTitleColor, for: .normal)
    }
}
