//
//  Extensions.swift
//  awarewego
//
//  Created by awarewego on 27/09/2019.
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

// MARK: - SearchController useful extensions
extension UIView {
    
    func centerIn(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        let layoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            leftAnchor.constraint(equalTo: layoutGuide.leftAnchor),
            bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
            rightAnchor.constraint(equalTo: layoutGuide.rightAnchor)
            ])
    }
}

extension UIViewController {
    func add(child: UIViewController) {
        addChild(child)
        child.view.centerIn(view: view)
        child.didMove(toParent: self)
    }

    func removeFromParent() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}

