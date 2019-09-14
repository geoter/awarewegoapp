//
//  BezierView.swift
//  awarewego
//
//  Created by awarewego on 14/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

@IBDesignable
class BezierView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        //// General Declarations
        drawCurvedBG(frame: self.bounds)
    }
    
    func drawCurvedBG(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 241, height: 46), resizing: ResizingBehavior = .aspectFill) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 241, height: 46), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 241, y: resizedFrame.height / 46)
        
        
        //// Color Declarations
        let color = UIColor(red: 0.153, green: 0.145, blue: 0.373, alpha: 1.000)
        let color4 = UIColor(red: 0.152, green: 0.147, blue: 0.371, alpha: 1.000)
        
        //// Group
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 44.49))
        bezierPath.addCurve(to: CGPoint(x: 51.02, y: 1.28), controlPoint1: CGPoint(x: 0, y: 44.49), controlPoint2: CGPoint(x: 18.37, y: 6.26))
        bezierPath.addCurve(to: CGPoint(x: 142.87, y: 7.92), controlPoint1: CGPoint(x: 83.68, y: -3.71), controlPoint2: CGPoint(x: 110.21, y: 7.92))
        bezierPath.addCurve(to: CGPoint(x: 227.13, y: 2.59), controlPoint1: CGPoint(x: 166.19, y: 7.92), controlPoint2: CGPoint(x: 206.18, y: 4.53))
        bezierPath.addCurve(to: CGPoint(x: 240.83, y: 1.28), controlPoint1: CGPoint(x: 235.5, y: 1.82), controlPoint2: CGPoint(x: 240.83, y: 1.28))
        color.setFill()
        bezierPath.fill()
        
        
        
        
        //// Bezier 2 Drawing
        
        
        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: 0, y: 44))
        bezier3Path.addLine(to: CGPoint(x: 241, y: 1))
        bezier3Path.addLine(to: CGPoint(x: 241, y: 103))
        bezier3Path.addLine(to: CGPoint(x: 0, y: 103))
        bezier3Path.addLine(to: CGPoint(x: 0, y: 44))
        bezier3Path.close()
        color4.setFill()
        bezier3Path.fill()
        
        context.restoreGState()
        
    }
    

}

public enum ResizingBehavior: Int {
    case aspectFit /// The content is proportionally resized to fit into the target rectangle.
    case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
    case stretch /// The content is stretched to match the entire target rectangle.
    case center /// The content is centered in the target rectangle, but it is NOT resized.
    
    public func apply(rect: CGRect, target: CGRect) -> CGRect {
        if rect == target || target == CGRect.zero {
            return rect
        }
        
        var scales = CGSize.zero
        scales.width = abs(target.width / rect.width)
        scales.height = abs(target.height / rect.height)
        
        switch self {
        case .aspectFit:
            scales.width = min(scales.width, scales.height)
            scales.height = scales.width
        case .aspectFill:
            scales.width = max(scales.width, scales.height)
            scales.height = scales.width
        case .stretch:
            break
        case .center:
            scales.width = 1
            scales.height = 1
        }
        
        var result = rect.standardized
        result.size.width *= scales.width
        result.size.height *= scales.height
        result.origin.x = target.minX + (target.width - result.width) / 2
        result.origin.y = target.minY + (target.height - result.height) / 2
        return result
    }
}
