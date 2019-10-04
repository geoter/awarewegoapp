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
    
    @IBInspectable var overlayColor:UIColor?
    @IBInspectable var titleOverlayColor:UIColor?
    @IBInspectable var selectedColor:UIColor?
    @IBInspectable var titleSelectedColor:UIColor? = nil {
           didSet{
               self.setTitleColor(oldValue, for: .selected)
           }
       }
    private var bgColor:UIColor!
    
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
        self.bgColor = self.backgroundColor
        self.tintColor = UIColor.clear
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
    
    override var isSelected: Bool{
        didSet
        {
            if isSelected == true {
                self.backgroundColor = selectedColor ?? self.backgroundColor
            }
            else{
                self.backgroundColor = bgColor
            }
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
        
        self.setTitleColor(titleColor(for: .normal), for: .highlighted)
        
        if addOverlay {
            let overlayview:UIView = UIView(frame: self.bounds)
            overlayview.backgroundColor = overlayColor ?? UIColor.black
            overlayview.alpha = 0.2
            overlayview.layer.cornerRadius = self.layer.cornerRadius
            overlayview.tag = kOverlayUniqueTag
            self.insertSubview(overlayview, belowSubview: self.titleLabel!)
            self.sendSubviewToBack(overlayview)
            
            self.setTitleColor(titleOverlayColor, for: .highlighted)
        }
    }
    
}


