//
//  ForgotViewController.swift
//  awarewego
//
//  Created by awarewego on 15/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

class ForgotViewController: UIViewController {

    @IBOutlet weak var castleTopConstraint: NSLayoutConstraint!
    
    @IBAction func emptySpaceTapped(_ sender: Any) {
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        if UIDevice().screenType == .iPhone6_7_8{
            castleTopConstraint.constant = 43 //default: 60
        }
    }
    
    @IBAction func sendForgotRequestPressed(_ sender: Any) {
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
