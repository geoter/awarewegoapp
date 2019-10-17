//
//  MissionInfoContainerVC.swift
//  awarewego
//
//  Created by awarewego on 10/10/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

class MissionInfoContainerVC: UIViewController {
    
    @IBOutlet weak var beginButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var beginButtonHeightConstraint: NSLayoutConstraint!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension MissionInfoContainerVC: MissionInfoTableVCScrollDelegate{
    
    func scrollBegan(scrollView:UIScrollView){
        self.beginButtonBottomConstraint.constant = -(20+self.beginButtonHeightConstraint.constant)
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    func scrollEnded(scrollView:UIScrollView){
        self.beginButtonBottomConstraint.constant = 20
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
}
