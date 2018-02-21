//
//  NewFlashCardViewController.swift
//  FlashTime
//
//  Created by C4Q on 2/20/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class NewFlashCardViewController: UIViewController {

    let newFlashCardView = NewFlashCardView()
    var category: Category!
    init(category: Category) {
        super.init(nibName: nil, bundle: nil)
        self.category = category
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(newFlashCardView)
       newFlashCardView.textField.delegate = self
        newFlashCardView.textView.delegate = self
        newFlashCardView.creationButton.addTarget(self, action: #selector(createButtonPressed), for: .touchUpInside)
        newFlashCardView.dismissVCButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)

     
    }
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (alert) in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func createButtonPressed() {
        guard !(newFlashCardView.textField.text?.isEmpty)! else { showAlert(title: "Error", message: "question cannot be blank"); return}
        guard !(newFlashCardView.textView.text.isEmpty) else { showAlert(title: "Error", message: "answer cannot be blank"); return}
        DBService.manager.newFlashCard(question: newFlashCardView.textField.text!, answer: newFlashCardView.textView.text!, categoryID: self.category.categoryID)
        showAlert(title: "Success", message: "New FlashCard Added!")
        
    }
    @objc func cancelButtonPressed() {
        //        Dismiss view
        dismiss(animated: true, completion: nil)
    }
    

}

extension NewFlashCardViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        
    }
}
extension NewFlashCardViewController: UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
