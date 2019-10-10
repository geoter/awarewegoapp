//
//  LoginViewController.swift
//  awarewego
//
//  Created by awarewego on 13/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var bezierBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var emailTxtF: RoundTextField!
    @IBOutlet weak var passwordTxtF: RoundTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if UIDevice().screenType == .iPhoneX_Xs || UIDevice().screenType == .iPhoneXr {
            bezierBottomConstraint.constant = 0 //default: 0
        }
        
    }
    
    @IBAction func emptySpaceTapped(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func forgotPasswordPressed(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindToLoginViewController(_ unwindSegue: UIStoryboardSegue) {
        _ = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }

}

extension LoginViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTxtF{
            passwordTxtF.becomeFirstResponder()
            return false
        }
        return true
    }
}
