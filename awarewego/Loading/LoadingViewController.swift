//
//  LoadingViewController.swift
//  awarewego
//
//  Created by awarewego on 23/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var logoHeightConstraint: NSLayoutConstraint!
    
    private var userAuthenticated = false
    private var initialTime:Date?
    private lazy var expirationTime:Date? = {
        return initialTime?.addingTimeInterval(1000)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        initialTime = Date()
        self.playBreathAnimation()
        
        if !isUserAuthenticated(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5/* one loop of  BreathAnimation duration time*/){
                self.showWelcome()
            }
        }
        else{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5/* one loop of  BreathAnimation duration time*/){
                self.showMissions()
            }
        }
    }
    
    func playBreathAnimation(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.logoHeightConstraint.constant = self.logoHeightConstraint.constant + 10
            UIView.animate(withDuration: 1.0, animations: {
                self.view.layoutIfNeeded()
            }) { (completed) in
                self.logoHeightConstraint.constant = self.logoHeightConstraint.constant - 10
                UIView.animate(withDuration: 1.0, animations: {
                   self.view.layoutIfNeeded()
                }) {(completed) in
                    if (self.isViewLoaded && ((self.view?.window) != nil)) {
                        // viewController is visible, prevents from keeping in memory after removing vc from navigation stack
                        self.playBreathAnimation()
                        print("playBreathAnimation")
                    }
                }
            }
        }
    }
    
    deinit {
        print("deinit")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.removeViewController(self)
        print("viewDidDisappear")
    }
    
    func showWelcome() {
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WelcomeVC")
        self.navigationController!.fadeTo(vc)
    }
    
    func showMissions(){
        let storyboard = UIStoryboard(name: "MainStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MissionsCollectionVC")
        self.navigationController!.fadeTo(vc)
    }

    func isUserAuthenticated() -> Bool{
        userAuthenticated = true
        return userAuthenticated
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
