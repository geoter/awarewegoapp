//
//  InsetLabel.swift
//  awarewego
//
//  Created by awarewego on 10/10/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable
class InsetLabel: UILabel {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var topInset: CGFloat = 0
    {
        didSet{
            contentInsets = UIEdgeInsets(top: topInset,left: leftInset,bottom: bottomInset,right: rightInset)
        }
    }
    
    @IBInspectable var bottomInset: CGFloat = 0
    {
          didSet{
              contentInsets = UIEdgeInsets(top: topInset,left: leftInset,bottom: bottomInset,right: rightInset)
          }
      }
    @IBInspectable var leftInset: CGFloat = 0
    {
          didSet{
              contentInsets = UIEdgeInsets(top: topInset,left: leftInset,bottom: bottomInset,right: rightInset)
          }
      }
    @IBInspectable var rightInset: CGFloat = 0
    {
          didSet{
              contentInsets = UIEdgeInsets(top: topInset,left: leftInset,bottom: bottomInset,right: rightInset)
          }
      }
    
    var contentInsets = UIEdgeInsets.zero

    override func drawText(in rect: CGRect) {
        let insetRect = rect.inset(by: contentInsets)
        super.drawText(in: insetRect)
    }

    override var intrinsicContentSize: CGSize {
        return addInsets(to: super.intrinsicContentSize)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return addInsets(to: super.sizeThatFits(size))
    }

    private func addInsets(to size: CGSize) -> CGSize {
        let width = size.width + contentInsets.left + contentInsets.right
        let height = size.height + contentInsets.top + contentInsets.bottom
        return CGSize(width: width, height: height)
    }

}
