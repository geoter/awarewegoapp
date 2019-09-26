//
//  globalExtensions.swift
//  awarewego
//
//  Created by awarewego on 11/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    func fadeTo(_ viewController: UIViewController) {
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        view.layer.add(transition, forKey: nil)
        pushViewController(viewController, animated: false)
    }
    
    func removeViewController(_ vc:UIViewController){
        var childVCs:[UIViewController] = self.viewControllers
        let indexToRemove = childVCs.firstIndex(where: { (item) -> Bool in
            item == vc
        })
        
        if let index = indexToRemove {
            childVCs.remove(at: index)
            self.viewControllers = childVCs
        }
    }
}

// used in Bezier Login views
public enum BezierResizingBehavior: Int {
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


public extension UIDevice {
    
    var iPhone: Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }
    
    enum ScreenType: String {
        case iPhone4
        case iPhone5
        case iPhone6_7_8
        case iPhone6_7_8_Plus
        case iPhoneX_Xs
        case iPhoneXr
        case Unknown
    }
    
    var screenType: ScreenType {
        guard iPhone else { return .Unknown}
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhone4
        case 1136:
            return .iPhone5
        case 1334:
            return .iPhone6_7_8
        case 1792:
            return .iPhoneXr
        case 2208, 1920:
            return .iPhone6_7_8_Plus
        case 2436:
            return .iPhoneX_Xs
        default:
            return .Unknown
        }
    }
    
}
