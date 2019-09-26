//
//  RoundButton.swift
//  awarewego
//
//  Created by awarewego on 28/08/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        initializeButtonProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeButtonProperties()
    }
    
    func initializeButtonProperties(){
        self.adjustsImageWhenHighlighted = false
        self.adjustsImageWhenDisabled = false
    }
    
    @IBInspectable var cornerRadius: CGFloat = 19{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    override open var isHighlighted: Bool {
        willSet {
            addHighlightShadow(newValue)
        }
    }
    
    let kOverlayUniqueTag = 33
    func addHighlightShadow(_ addOverlay:Bool){
        
        for subview:UIView in self.subviews{
            if(subview.tag == kOverlayUniqueTag){
                subview.removeFromSuperview()
            }
        }
        
        if addOverlay {
            
            let overlayview:UIView = UIView(frame: self.bounds)
            overlayview.backgroundColor = UIColor.black
            overlayview.alpha = 0.2
            overlayview.layer.cornerRadius = self.layer.cornerRadius
            overlayview.tag = kOverlayUniqueTag
            self.insertSubview(overlayview, belowSubview: self.titleLabel!)
            self.sendSubviewToBack(overlayview)
        }
    }
    
}


