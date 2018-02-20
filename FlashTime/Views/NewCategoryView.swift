//
//  NewCategoryView.swift
//  FlashTime
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class NewCategoryView: UIView {

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
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
    
    lazy var dismissVCButton: UIButton = {
        let bttn = UIButton()
        bttn.setTitle("CANCEL", for: .normal)
        bttn.backgroundColor = .orange
        return bttn
    }()
    
    lazy var titleLabel: UILabel = {
        let iv = UILabel()
        iv.text = "Add a new Category"
        return iv
    }()
    
    lazy var creationButton: UIButton = {
        let bttn = UIButton()
        bttn.setTitle("CREATE", for: .normal)
        bttn.setTitleColor(.orange, for: .normal)
        return bttn
    }()
    
    lazy var titleField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Category name."
        tf.layer.cornerRadius = 10
        return tf
    }()
    
    
    
    func setupViews() {
        setTitleLabel()
        setHeaderStackView()
        setTitleField()
        
    }
    
    func setTitleLabel() {
        self.addSubview(titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
        }
        
    }
    
    func setHeaderStackView() {
        self.addSubview(headerStackView)
        self.headerStackView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
            make.right.equalTo(self.snp.right).offset(-20)
            make.left.equalTo(self.snp.left).offset(20)
            
        }
        
    }
    
    func setTitleField() {
        self.addSubview(titleField)
        self.titleField.snp.makeConstraints { (make) in
            make.top.equalTo(headerStackView.snp.bottom).offset(20)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
            make.leading.equalTo(self.snp.leading).offset(20)
            make.height.equalTo(self.snp.height).multipliedBy(0.1)
        }
        
    }
}
