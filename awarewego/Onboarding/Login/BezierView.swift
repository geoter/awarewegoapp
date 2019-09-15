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
        let fillColor = UIColor(red: 0.627, green: 0.616, blue: 0.557, alpha: 1.000)
        
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
        
        
        //// rocks.svg Group
        //// Fill_1 Drawing
        let fill_1Path = UIBezierPath()
        fill_1Path.move(to: CGPoint(x: 207.51, y: 6.05))
        fill_1Path.addLine(to: CGPoint(x: 207.5, y: 6.05))
        fill_1Path.addCurve(to: CGPoint(x: 206.67, y: 4.62), controlPoint1: CGPoint(x: 206.96, y: 5.76), controlPoint2: CGPoint(x: 206.64, y: 5.21))
        fill_1Path.addLine(to: CGPoint(x: 206.67, y: 4.63))
        fill_1Path.addCurve(to: CGPoint(x: 207.53, y: 3.37), controlPoint1: CGPoint(x: 206.8, y: 4.13), controlPoint2: CGPoint(x: 207.1, y: 3.69))
        fill_1Path.addLine(to: CGPoint(x: 207.5, y: 3.4))
        fill_1Path.addCurve(to: CGPoint(x: 209.05, y: 2.26), controlPoint1: CGPoint(x: 207.94, y: 2.94), controlPoint2: CGPoint(x: 208.46, y: 2.55))
        fill_1Path.addLine(to: CGPoint(x: 209.1, y: 2.24))
        fill_1Path.addCurve(to: CGPoint(x: 212.15, y: 2.51), controlPoint1: CGPoint(x: 210.1, y: 1.85), controlPoint2: CGPoint(x: 211.24, y: 1.96))
        fill_1Path.addLine(to: CGPoint(x: 212.41, y: 2.84))
        fill_1Path.addLine(to: CGPoint(x: 212.4, y: 2.83))
        fill_1Path.addCurve(to: CGPoint(x: 212.02, y: 6.51), controlPoint1: CGPoint(x: 213.25, y: 3.98), controlPoint2: CGPoint(x: 213.09, y: 5.54))
        fill_1Path.addLine(to: CGPoint(x: 212.02, y: 6.52))
        fill_1Path.addLine(to: CGPoint(x: 211.98, y: 6.53))
        fill_1Path.addCurve(to: CGPoint(x: 209.24, y: 6.53), controlPoint1: CGPoint(x: 211.08, y: 6.69), controlPoint2: CGPoint(x: 210.15, y: 6.69))
        fill_1Path.addLine(to: CGPoint(x: 209.2, y: 6.52))
        fill_1Path.addCurve(to: CGPoint(x: 207.5, y: 6.05), controlPoint1: CGPoint(x: 208.61, y: 6.47), controlPoint2: CGPoint(x: 208.03, y: 6.31))
        fill_1Path.addLine(to: CGPoint(x: 207.51, y: 6.05))
        fill_1Path.close()
        fillColor.setFill()
        fill_1Path.fill()
        
        
        //// Fill_7 Drawing
        let fill_7Path = UIBezierPath()
        fill_7Path.move(to: CGPoint(x: 198.41, y: 4.38))
        fill_7Path.addCurve(to: CGPoint(x: 195.83, y: 4.56), controlPoint1: CGPoint(x: 197.73, y: 3.9), controlPoint2: CGPoint(x: 196.57, y: 4.41))
        fill_7Path.addLine(to: CGPoint(x: 195.85, y: 4.55))
        fill_7Path.addCurve(to: CGPoint(x: 194.4, y: 5.1), controlPoint1: CGPoint(x: 195.34, y: 4.67), controlPoint2: CGPoint(x: 194.85, y: 4.86))
        fill_7Path.addCurve(to: CGPoint(x: 193.77, y: 6.1), controlPoint1: CGPoint(x: 193.97, y: 5.3), controlPoint2: CGPoint(x: 193.92, y: 5.72))
        fill_7Path.addLine(to: CGPoint(x: 193.77, y: 6.1))
        fill_7Path.addCurve(to: CGPoint(x: 193.89, y: 6.52), controlPoint1: CGPoint(x: 193.73, y: 6.25), controlPoint2: CGPoint(x: 193.78, y: 6.41))
        fill_7Path.addCurve(to: CGPoint(x: 196.41, y: 6.66), controlPoint1: CGPoint(x: 194.61, y: 7.27), controlPoint2: CGPoint(x: 195.53, y: 7.12))
        fill_7Path.addCurve(to: CGPoint(x: 197.72, y: 5.95), controlPoint1: CGPoint(x: 196.86, y: 6.43), controlPoint2: CGPoint(x: 197.27, y: 6.16))
        fill_7Path.addCurve(to: CGPoint(x: 198.69, y: 5.01), controlPoint1: CGPoint(x: 198.2, y: 5.72), controlPoint2: CGPoint(x: 198.58, y: 5.54))
        fill_7Path.addLine(to: CGPoint(x: 198.68, y: 5.02))
        fill_7Path.addCurve(to: CGPoint(x: 198.41, y: 4.38), controlPoint1: CGPoint(x: 198.74, y: 4.77), controlPoint2: CGPoint(x: 198.63, y: 4.52))
        fillColor.setFill()
        fill_7Path.fill()
        
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
