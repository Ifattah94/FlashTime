//
//  CreateAccountViewController.swift
//  FlashTime
//
//  Created by C4Q on 2/16/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    var email: String?
    var username: String?
    var password: String?
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.delegate = self
        userNameTF.delegate = self
        passwordTF.delegate = self

    }
    
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (alert) in
            self.dismiss(animated: true, completion: {})
            
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        AuthUserService.manager.createAccount(withEmail: email!, userName: username!, password: password!)
        let alertController = UIAlertController(title: "Success!", message: "User Created!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (alert) in
            self.dismiss(animated: true, completion: {self.resignFirstResponder()})
            self.resignFirstResponder()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        //TODO add animation and completion for dismiss button 
        self.dismiss(animated: true, completion: nil)
    }
    

}

extension CreateAccountViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        switch textField.tag {
        case 0 :
            email = textField.text!
        case 1:
            username = textField.text!
        case 2:
            password = textField.text!
        default:
            break
        }
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        switch textField.tag {
        case 0 :
            email = textField.text!
        case 1:
            username = textField.text!
        case 2:
            password = textField.text!
        default:
            break
        }
    }
    
}


