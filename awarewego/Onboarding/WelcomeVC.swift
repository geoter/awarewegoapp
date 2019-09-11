//
//  WelcomeVC.swift
//  awarewego
//
//  Created by awarewego on 28/08/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit
import SwiftyOnboard

class WelcomeVC: UIViewController {

    @IBOutlet weak var swiftyOnboard: SwiftyOnboard!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swiftyOnboard.style = .light
        swiftyOnboard.delegate = self
        swiftyOnboard.dataSource = self
        swiftyOnboard.fadePages = true
    }
    
    @objc func loginPressed(_ sender: Any) {
    }
    
    @objc func registerPressed(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WelcomeVC: SwiftyOnboardDelegate, SwiftyOnboardDataSource {
    
    func swiftyOnboardNumberOfPages(_ swiftyOnboard: SwiftyOnboard) -> Int {
        return 3
    }
    
    func swiftyOnboardPageForIndex(_ swiftyOnboard: SwiftyOnboard, index: Int) -> SwiftyOnboardPage? {
        let page = OnboardPage.instanceFromNib() as? OnboardPage
        page?.configure(pageModel: onboardPageModel(atIndex: index))
        return page
    }
    
    func onboardPageModel(atIndex index:Int) -> OnboardPageModel {
        
        struct PageModel{
            var title:String
            var subtitle:String
            var imageName:String
            var bgColor:UIColor
        }
        
        var pageModels:[PageModel] = []
        pageModels.append(
            PageModel(
                title:"Discover amazing places",
                subtitle:"Explore hidden valleys",
                imageName:"onboard_1",
                bgColor:#colorLiteral(red: 0.9294117647, green: 0.8509803922, blue: 0.8235294118, alpha: 1)
        ))
        pageModels.append(
            PageModel(
                title:"Help the locals",
                subtitle:"Solve real problems and help make the community a better place",
                imageName:"onboard_1",
                bgColor:#colorLiteral(red: 0.5764705882, green: 0.6862745098, blue: 0.2274509804, alpha: 1)
        ))
        pageModels.append(
            PageModel(
                title:"Collect memorable gifts",
                subtitle:"Local products,tastes and more",
                imageName:"onboard_1",
                bgColor:#colorLiteral(red: 0.3019607843, green: 0.2666666667, blue: 0.5568627451, alpha: 1)
        ))
        
        let currentModel = pageModels[index]
        return OnboardPageModel(
            title: currentModel.title,
            subtitle: currentModel.subtitle,
            image: UIImage(named:currentModel.imageName)!,
            bgColor: currentModel.bgColor)
    }
    
    //for the transition phase
    func swiftyOnboardBackgroundColorFor(_ swiftyOnboard: SwiftyOnboard, atIndex index: Int) -> UIColor?{
        let pageColors = [#colorLiteral(red: 0.9294117647, green: 0.8509803922, blue: 0.8235294118, alpha: 1),#colorLiteral(red: 0.5764705882, green: 0.6862745098, blue: 0.2274509804, alpha: 1),#colorLiteral(red: 0.3019607843, green: 0.2666666667, blue: 0.5568627451, alpha: 1)]
        return pageColors[index]
    }
    
    func swiftyOnboardViewForOverlay(_ swiftyOnboard: SwiftyOnboard) -> SwiftyOnboardOverlay? {
        let overlay = OnboardOverlay.instanceFromNib() as? OnboardOverlay
        overlay?.logInButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        overlay?.signUpButton.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
        return overlay
    }
    
    func swiftyOnboardOverlayForPosition(_ swiftyOnboard: SwiftyOnboard, overlay: SwiftyOnboardOverlay, for position: Double) {
        let overlay = overlay as! OnboardOverlay
        let currentPage = round(position)
        overlay.contentControl.currentPage = Int(currentPage)
        
        struct ButtonConfig{
            var titleColor: UIColor
            var backgroundColor: UIColor
        }
        
        let colors = [
            ["login":ButtonConfig(titleColor: #colorLiteral(red: 0.3960784314, green: 0.3843137255, blue: 0.4078431373, alpha: 1), backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)),
             "signup":ButtonConfig(titleColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), backgroundColor: #colorLiteral(red: 0.3960784314, green: 0.3843137255, blue: 0.4078431373, alpha: 1))],
            ["login":ButtonConfig(titleColor: #colorLiteral(red: 0.4980392157, green: 0.5764705882, blue: 0.1725490196, alpha: 1), backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)),
             "signup":ButtonConfig(titleColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), backgroundColor: #colorLiteral(red: 0.4980392157, green: 0.5764705882, blue: 0.1725490196, alpha: 1))],
            ["login":ButtonConfig(titleColor: #colorLiteral(red: 0.4039215686, green: 0.3607843137, blue: 0.6549019608, alpha: 1), backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)),
             "signup":ButtonConfig(titleColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), backgroundColor: #colorLiteral(red: 0.4039215686, green: 0.3607843137, blue: 0.6549019608, alpha: 1))]]
        
        var currentColors = colors[Int(currentPage)]
        let loginColor = currentColors["login"]
        let signupColor = currentColors["signup"]
        
        overlay.configure(
            loginButtonStyle: OnboardOverlayStyle(buttonBgColor: loginColor!.backgroundColor, buttonTitleColor: loginColor!.titleColor),
            signUpButtonStyle: OnboardOverlayStyle(buttonBgColor: signupColor!.backgroundColor, buttonTitleColor: signupColor!.titleColor)
        )
    }
}
