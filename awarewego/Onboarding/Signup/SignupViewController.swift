//
//  SignupViewController.swift
//  awarewego
//
//  Created by awarewego on 16/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var usernameTxtF: RoundTextField!
    @IBOutlet weak var emailTxtF: RoundTextField!
    @IBOutlet weak var passwordTxtF: RoundTextField!
    
    @IBOutlet weak var bezierBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if UIDevice().screenType == .iPhoneX_Xs || UIDevice().screenType == .iPhoneXr {
            bezierBottomConstraint.constant = 0 //default: 0
        }
    }
    
    @IBAction func emptySpaceTapped(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func signupPressed(_ sender: Any) {
    }
    
    @IBAction func facebookLoginPressed(_ sender: Any) {
    }
    
    @IBAction func googleLoginPressed(_ sender: Any) {
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

extension SignupViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTxtF{
            emailTxtF.becomeFirstResponder()
            return false
        }
        else if textField == emailTxtF{
            passwordTxtF.becomeFirstResponder()
            return false
        }
        return true
    }
}
