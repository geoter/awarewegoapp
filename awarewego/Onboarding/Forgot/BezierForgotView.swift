//
//  BezierForgotView.swift
//  awarewego
//
//  Created by awarewego on 15/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

@IBDesignable
class BezierForgotView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        //// General Declarations
        drawCurvedBG(frame: self.bounds)
    }
    
    func drawCurvedBG(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 376, height: 69), resizing: BezierResizingBehavior = .aspectFit) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 376, height: 69), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 376, y: resizedFrame.height / 69)
        
        
        //// Color Declarations
        let fillColor = UIColor(red: 0.153, green: 0.145, blue: 0.373, alpha: 1.000)
        let fillColor2 = UIColor(red: 0.627, green: 0.616, blue: 0.557, alpha: 1.000)
        
        //// Mask_Group_5
        context.saveGState()
        context.beginTransparencyLayer(auxiliaryInfo: nil)
        
        //// Clip Mask_Group_
        let mask_Group_Path = UIBezierPath(rect: CGRect(x: 0, y: -79, width: 376, height: 304))
        mask_Group_Path.addClip()
        
        
        //// Background Drawing
        let backgroundPath = UIBezierPath()
        backgroundPath.move(to: CGPoint(x: -10.12, y: 55.85))
        backgroundPath.addCurve(to: CGPoint(x: 58.91, y: 24.72), controlPoint1: CGPoint(x: 13.53, y: 47.25), controlPoint2: CGPoint(x: 35.44, y: 33.86))
        backgroundPath.addCurve(to: CGPoint(x: 411.66, y: 18.48), controlPoint1: CGPoint(x: 170.22, y: -18.66), controlPoint2: CGPoint(x: 294.73, y: 38.69))
        backgroundPath.addCurve(to: CGPoint(x: 679.81, y: -75.82), controlPoint1: CGPoint(x: 504.8, y: 2.39), controlPoint2: CGPoint(x: 586.38, y: -61.82))
        backgroundPath.addCurve(to: CGPoint(x: 827.35, y: -78.3), controlPoint1: CGPoint(x: 728.57, y: -83.13), controlPoint2: CGPoint(x: 778.15, y: -76.35))
        backgroundPath.addCurve(to: CGPoint(x: 983.65, y: 340.95), controlPoint1: CGPoint(x: 876.55, y: -80.25), controlPoint2: CGPoint(x: 984.02, y: 183.48))
        backgroundPath.addCurve(to: CGPoint(x: 721.69, y: 391.25), controlPoint1: CGPoint(x: 898.83, y: 331.6), controlPoint2: CGPoint(x: 806.62, y: 383.29))
        backgroundPath.addCurve(to: CGPoint(x: -452.93, y: 400.51), controlPoint1: CGPoint(x: 334.9, y: 427.49), controlPoint2: CGPoint(x: -65.98, y: 434.73))
        backgroundPath.addCurve(to: CGPoint(x: -452.93, y: 311.94), controlPoint1: CGPoint(x: -459.58, y: 399.92), controlPoint2: CGPoint(x: -448.4, y: 317.21))
        backgroundPath.addCurve(to: CGPoint(x: -457.7, y: 292.22), controlPoint1: CGPoint(x: -457.32, y: 306.82), controlPoint2: CGPoint(x: -457.69, y: 299.18))
        backgroundPath.addLine(to: CGPoint(x: -457.7, y: 291.37))
        backgroundPath.addCurve(to: CGPoint(x: -426.06, y: 91.56), controlPoint1: CGPoint(x: -457.7, y: 223.52), controlPoint2: CGPoint(x: -447.02, y: 156.09))
        backgroundPath.addCurve(to: CGPoint(x: -342.78, y: 6.78), controlPoint1: CGPoint(x: -410.44, y: 42.82), controlPoint2: CGPoint(x: -397.42, y: 10.33))
        backgroundPath.addCurve(to: CGPoint(x: -240.3, y: 31.03), controlPoint1: CGPoint(x: -307.63, y: 4.49), controlPoint2: CGPoint(x: -272.76, y: 18.33))
        backgroundPath.addCurve(to: CGPoint(x: -10.12, y: 55.85), controlPoint1: CGPoint(x: -166.4, y: 59.96), controlPoint2: CGPoint(x: -84.6, y: 82.96))
        backgroundPath.close()
        fillColor.setFill()
        backgroundPath.fill()
        
        
        context.endTransparencyLayer()
        context.restoreGState()
        
        
        //// Fill_7 Drawing
        let fill_7Path = UIBezierPath()
        fill_7Path.move(to: CGPoint(x: 150.52, y: 26.74))
        fill_7Path.addCurve(to: CGPoint(x: 145.66, y: 27.09), controlPoint1: CGPoint(x: 149.25, y: 25.79), controlPoint2: CGPoint(x: 147.07, y: 26.8))
        fill_7Path.addLine(to: CGPoint(x: 145.7, y: 27.08))
        fill_7Path.addCurve(to: CGPoint(x: 142.96, y: 28.16), controlPoint1: CGPoint(x: 144.74, y: 27.32), controlPoint2: CGPoint(x: 143.82, y: 27.69))
        fill_7Path.addCurve(to: CGPoint(x: 141.79, y: 30.16), controlPoint1: CGPoint(x: 142.17, y: 28.56), controlPoint2: CGPoint(x: 142.06, y: 29.4))
        fill_7Path.addLine(to: CGPoint(x: 141.79, y: 30.16))
        fill_7Path.addCurve(to: CGPoint(x: 142.01, y: 31), controlPoint1: CGPoint(x: 141.71, y: 30.46), controlPoint2: CGPoint(x: 141.79, y: 30.78))
        fill_7Path.addCurve(to: CGPoint(x: 146.77, y: 31.29), controlPoint1: CGPoint(x: 143.37, y: 32.49), controlPoint2: CGPoint(x: 145.1, y: 32.19))
        fill_7Path.addCurve(to: CGPoint(x: 149.24, y: 29.86), controlPoint1: CGPoint(x: 147.61, y: 30.83), controlPoint2: CGPoint(x: 148.38, y: 30.29))
        fill_7Path.addCurve(to: CGPoint(x: 151.05, y: 28), controlPoint1: CGPoint(x: 150.13, y: 29.41), controlPoint2: CGPoint(x: 150.86, y: 29.05))
        fill_7Path.addLine(to: CGPoint(x: 151.05, y: 28))
        fill_7Path.addCurve(to: CGPoint(x: 150.53, y: 26.74), controlPoint1: CGPoint(x: 151.16, y: 27.51), controlPoint2: CGPoint(x: 150.95, y: 27.01))
        fillColor2.setFill()
        fill_7Path.fill()
        
        
        //// Fill_1 Drawing
        let fill_1Path = UIBezierPath()
        fill_1Path.move(to: CGPoint(x: 162.69, y: 32.06))
        fill_1Path.addLine(to: CGPoint(x: 162.68, y: 32.06))
        fill_1Path.addCurve(to: CGPoint(x: 161.11, y: 29.22), controlPoint1: CGPoint(x: 161.66, y: 31.49), controlPoint2: CGPoint(x: 161.05, y: 30.39))
        fill_1Path.addLine(to: CGPoint(x: 161.11, y: 29.23))
        fill_1Path.addCurve(to: CGPoint(x: 162.73, y: 26.73), controlPoint1: CGPoint(x: 161.36, y: 28.24), controlPoint2: CGPoint(x: 161.93, y: 27.36))
        fill_1Path.addLine(to: CGPoint(x: 162.67, y: 26.79))
        fill_1Path.addCurve(to: CGPoint(x: 165.59, y: 24.51), controlPoint1: CGPoint(x: 163.51, y: 25.87), controlPoint2: CGPoint(x: 164.5, y: 25.09))
        fill_1Path.addLine(to: CGPoint(x: 165.69, y: 24.46))
        fill_1Path.addCurve(to: CGPoint(x: 171.44, y: 25.02), controlPoint1: CGPoint(x: 167.58, y: 23.7), controlPoint2: CGPoint(x: 169.73, y: 23.91))
        fill_1Path.addLine(to: CGPoint(x: 171.93, y: 25.67))
        fill_1Path.addLine(to: CGPoint(x: 171.92, y: 25.65))
        fill_1Path.addCurve(to: CGPoint(x: 171.21, y: 32.99), controlPoint1: CGPoint(x: 173.52, y: 27.94), controlPoint2: CGPoint(x: 173.22, y: 31.05))
        fill_1Path.addLine(to: CGPoint(x: 171.2, y: 33))
        fill_1Path.addLine(to: CGPoint(x: 171.13, y: 33.01))
        fill_1Path.addCurve(to: CGPoint(x: 165.96, y: 33.01), controlPoint1: CGPoint(x: 169.42, y: 33.35), controlPoint2: CGPoint(x: 167.67, y: 33.35))
        fill_1Path.addLine(to: CGPoint(x: 165.88, y: 33.01))
        fill_1Path.addCurve(to: CGPoint(x: 162.68, y: 32.06), controlPoint1: CGPoint(x: 164.76, y: 32.91), controlPoint2: CGPoint(x: 163.67, y: 32.59))
        fill_1Path.addLine(to: CGPoint(x: 162.69, y: 32.06))
        fill_1Path.close()
        fillColor2.setFill()
        fill_1Path.fill()
        
        context.restoreGState()
        
    }
}
