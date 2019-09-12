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
    
    var circularTimer: Timer?
    var nextAddition: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swiftyOnboard.style = .light
        swiftyOnboard.delegate = self
        swiftyOnboard.dataSource = self
        swiftyOnboard.fadePages = true
        swiftyOnboard.shouldSwipe = true
        initializeCirculation()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        cancelCirculation()
    }
    
    func initializeCirculation(){
        cancelCirculation() //if any previous
        circularTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(circulateSwiftyOnboard), userInfo: nil, repeats: true)
    }
    
    func cancelCirculation(){
        circularTimer?.invalidate()
    }
    
    @objc func circulateSwiftyOnboard() {
        
        let numberOfPages = swiftyOnboardNumberOfPages(swiftyOnboard)
        guard numberOfPages > 0 else{return}
        
        if (swiftyOnboard.currentPage+1) >= numberOfPages{
            nextAddition = -1
        }
        else if (swiftyOnboard.currentPage-1) <= -1
        {
            nextAddition = 1
        }
        
        swiftyOnboard.goToPage(index: swiftyOnboard.currentPage+nextAddition, animated: true)
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
            var bgColor_bottom:UIColor
            var bgColor_top:UIColor
            var textColor:UIColor
        }
        
        var pageModels:[PageModel] = []
        pageModels.append(
            PageModel(
                title:"Discover amazing places",
                subtitle:"Explore hidden valleys",
                imageName:"onboard_1",
                bgColor_bottom: #colorLiteral(red: 0.9294117647, green: 0.8509803922, blue: 0.8235294118, alpha: 1),
                bgColor_top: #colorLiteral(red: 0.9294117647, green: 0.8509803922, blue: 0.8235294118, alpha: 1),
                textColor: #colorLiteral(red: 0.2470588235, green: 0.2549019608, blue: 0.2509803922, alpha: 1)
        ))
        pageModels.append(
            PageModel(
                title:"Help the locals",
                subtitle:"Solve real problems and help make the community a better place",
                imageName:"onboard_2",
                bgColor_bottom:#colorLiteral(red: 0.5764705882, green: 0.6862745098, blue: 0.2274509804, alpha: 1),
                bgColor_top: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                textColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ))
        pageModels.append(
            PageModel(
                title:"Collect memorable gifts",
                subtitle:"Local products,tastes and more",
                imageName:"onboard_3",
                bgColor_bottom: #colorLiteral(red: 0.3019607843, green: 0.2666666667, blue: 0.5568627451, alpha: 1),
                bgColor_top: #colorLiteral(red: 0.4039215686, green: 0.3607843137, blue: 0.6549019608, alpha: 1),
                textColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ))
        
        let currentModel = pageModels[index]
        return OnboardPageModel(
            title: currentModel.title,
            subtitle: currentModel.subtitle,
            textColor: currentModel.textColor,
            image: UIImage(named:currentModel.imageName)!,
            bgColor_bottom: currentModel.bgColor_bottom,
            bgColor_top: currentModel.bgColor_top
        )
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
    
    //called when user swiped pages
    func swiftyOnboard(_ swiftyOnboard: SwiftyOnboard, currentPage index: Int) {
        print("now")
        initializeCirculation()
    }
    
    func swiftyOnboardOverlayForPosition(_ swiftyOnboard: SwiftyOnboard, overlay: SwiftyOnboardOverlay, for position: Double) {
        let overlay = overlay as! OnboardOverlay
        let currentPage = Int(round(position))
        overlay.barsContentControl.set(progress: currentPage, animated: true)
        
        struct ButtonConfig{
            var titleColor: UIColor
            var backgroundColor: UIColor
        }
        
        let colors = [
            ["login":ButtonConfig(titleColor: #colorLiteral(red: 0.3960784314, green: 0.3843137255, blue: 0.4078431373, alpha: 1), backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)),
             "signup":ButtonConfig(titleColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), backgroundColor: #colorLiteral(red: 0.3960784314, green: 0.3843137255, blue: 0.4078431373, alpha: 1)),
             "pageControl": OverlayPageControlStyle(tintColor: #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.4549019608, alpha: 0.7398598031), selectedTintColor: #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.4549019608, alpha: 1))],
            ["login":ButtonConfig(titleColor: #colorLiteral(red: 0.4980392157, green: 0.5764705882, blue: 0.1725490196, alpha: 1), backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)),
             "signup":ButtonConfig(titleColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), backgroundColor: #colorLiteral(red: 0.4980392157, green: 0.5764705882, blue: 0.1725490196, alpha: 1)),
             "pageControl": OverlayPageControlStyle(tintColor: #colorLiteral(red: 0.7764705882, green: 0.8156862745, blue: 0.6470588235, alpha: 1), selectedTintColor: #colorLiteral(red: 0.4980392157, green: 0.5764705882, blue: 0.1725490196, alpha: 1))],
            ["login":ButtonConfig(titleColor: #colorLiteral(red: 0.4039215686, green: 0.3607843137, blue: 0.6549019608, alpha: 1), backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)),
             "signup":ButtonConfig(titleColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), backgroundColor: #colorLiteral(red: 0.4039215686, green: 0.3607843137, blue: 0.6549019608, alpha: 1)),
             "pageControl": OverlayPageControlStyle(tintColor: #colorLiteral(red: 0.4039215686, green: 0.3607843137, blue: 0.6549019608, alpha: 1), selectedTintColor: #colorLiteral(red: 0.7882352941, green: 0.7882352941, blue: 0.7882352941, alpha: 1))]]
        
        var currentColors = colors[currentPage]
        let loginColor:ButtonConfig = currentColors["login"] as! ButtonConfig
        let signupColor:ButtonConfig = currentColors["signup"] as! ButtonConfig
        let pageControlColors: OverlayPageControlStyle = currentColors["pageControl"] as! OverlayPageControlStyle
        
        overlay.configure(
            loginButtonStyle: OnboardOverlayStyle(buttonBgColor: loginColor.backgroundColor, buttonTitleColor: loginColor.titleColor),
            signUpButtonStyle: OnboardOverlayStyle(buttonBgColor: signupColor.backgroundColor, buttonTitleColor: signupColor.titleColor),
            pageControlStyle:pageControlColors,
            logoStyle: (currentPage == 2) ? .light : .dark
        )
    }
}
