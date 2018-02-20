//
//  NewFlashCardView.swift
//  FlashTime
//
//  Created by C4Q on 2/20/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class NewFlashCardView: UIView {

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    lazy var dismissVCButton: UIButton = {
        let bttn = UIButton()
        bttn.setTitle("Cancel", for: .normal)
        //bttn.backgroundColor = .white
        bttn.setTitleColor(.orange, for: .normal)
        return bttn
    }()
    lazy var creationButton: UIButton = {
        let bttn = UIButton()
        bttn.setTitle("Create", for: .normal)
        bttn.setTitleColor(.orange, for: .normal)
        return bttn
    }()
    lazy var titleLabel: UILabel = {
        let iv = UILabel()
        iv.text = "Create a new flashcard"
        return iv
    }()
    lazy var answerLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Enter an answer"
        lab.textAlignment = .center
        return lab
    }()
    lazy var textField: UITextField = {
        let tf = UITextField()
        //tf.backgroundColor = .blue
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 10
        tf.placeholder = "Enter a question"
        return tf
    }()
    lazy var textView: UITextView = {
        let tv = UITextView()
        // tv.text = ""
        tv.layer.cornerRadius = 10
        tv.layer.borderWidth = 2
        tv.layer.borderColor = UIColor.lightGray.cgColor
        return tv
    }()
    lazy var headerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 15
        
        stack.addArrangedSubview(dismissVCButton)
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(creationButton)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
  
    
    private func setupViews() {
        setHeaderStackView()
        setTextField()
        setupTipLabel()
        setupTextView()

    }
    func setTextField() {
        self.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 15).isActive = true
        textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
    func setHeaderStackView() {
        self.addSubview(headerStackView)
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        headerStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        headerStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        headerStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
    }
    private func setupTipLabel() {
        addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15).isActive = true
        answerLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor).isActive = true
        answerLabel.trailingAnchor.constraint(equalTo: textField.trailingAnchor).isActive = true
        answerLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    private func setupTextView() {
        addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 15).isActive = true
        textView.leadingAnchor.constraint(equalTo: answerLabel.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: answerLabel.trailingAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
        

}
