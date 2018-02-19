//
//  ViewController.swift
//  FlashTime
//
//  Created by C4Q on 2/15/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    var email: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.delegate = self
        passwordTF.delegate = self
        AuthUserService.manager.delegate = self
        
        
    }
    
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        login()
    }
    
}


extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0{
            print(textField.text!)
            email = textField.text!
        }else{
            password = textField.text!
        }
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0{
            print(textField.text!)
            email = textField.text!
        }else{
            password = textField.text!
        }
        textField.resignFirstResponder()
    }
}

extension LoginViewController {
    func login() {
        SVProgressHUD.show()
        AuthUserService.manager.login(withEmail: emailTF.text!, andPassword: passwordTF.text!)
    }
    
    public static func storyBoardInstance() -> LoginViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        return VC
    }
}

extension LoginViewController: AuthUserServiceDelegate {
    func didLogin(_ authUserService: AuthUserService, appUser: AppUser) {
        print("login successful")
        SVProgressHUD.dismiss()
        self.present(TabViewController(), animated: true, completion: nil)
    }
    
}
//TODO forgot password VC



