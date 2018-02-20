//
//  NewCategoryViewController.swift
//  FlashTime
//
//  Created by C4Q on 2/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class NewCategoryViewController: UIViewController {
let newCatView = NewCategoryView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(newCatView)
        newCatView.creationButton.addTarget(self, action: #selector(createButtonPressed), for: .touchUpInside)
        newCatView.dismissVCButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        newCatView.titleField.delegate = self 

        
    }
    
    

    @objc func createButtonPressed() {
        guard !(newCatView.titleField.text?.isEmpty)! else {
            showAlert(title: "Error", message: "Category name cannot be blank")
            return
        }
        if let currentUserDisplayName = AuthUserService.getCurrentUser()?.displayName {
            DBService.manager.newCategory(name: newCatView.titleField.text!, byUser: currentUserDisplayName)
            
        }
        showAlert(title: "Success", message: "New Category Added!")
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (alert) in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    @objc func cancelButtonPressed() {
        //        Dismiss view
        dismiss(animated: true, completion: nil)
    }

}

extension NewCategoryViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        
    }
}
