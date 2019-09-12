//
//  CustomOverlay.swift
//  SwiftyOnboardExample
//
//  Created by Jay on 3/27/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
import SwiftyOnboard
import CHIPageControl

struct OnboardOverlayStyle {
    var buttonBgColor: UIColor = UIColor.white
    var buttonTitleColor: UIColor = UIColor.white
}

struct OverlayPageControlStyle {
    var tintColor: UIColor = UIColor.white
    var selectedTintColor: UIColor = UIColor.white
}

class OnboardOverlay: SwiftyOnboardOverlay {
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var barsContentControl: CHIPageControlJaloro!
    @IBOutlet weak var logoTitle: UILabel!
    
    public var logoStyle:LogoStyle = .dark
    
    enum LogoStyle {
        case light
        case dark
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "OnboardOverlay", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func configure(loginButtonStyle:OnboardOverlayStyle,signUpButtonStyle:OnboardOverlayStyle,pageControlStyle:OverlayPageControlStyle,logoStyle:LogoStyle = .dark){
        
        UIView.animate(withDuration: 0.3) {
            //Background colors
            self.logInButton.backgroundColor = loginButtonStyle.buttonBgColor
            self.signUpButton.backgroundColor = signUpButtonStyle.buttonBgColor
            //Text colors
            self.logInButton.setTitleColor(loginButtonStyle.buttonTitleColor, for: .normal)
            self.signUpButton.setTitleColor(signUpButtonStyle.buttonTitleColor, for: .normal)
        }
        
        barsContentControl.tintColor = pageControlStyle.tintColor
        barsContentControl.currentPageTintColor = pageControlStyle.selectedTintColor
        
        logoTitle.textColor = (logoStyle == .dark) ? #colorLiteral(red: 0.2470588235, green: 0.2549019608, blue: 0.2509803922, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
}
