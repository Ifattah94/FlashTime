//
//  CategoryTableViewCell.swift
//  FlashTime
//
//  Created by C4Q on 2/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class CategoryTableViewCell: UITableViewCell {

    
    lazy var categoryImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 8.0
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var categoryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var numberOfCardsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: "CategoryCell")
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    
    private func commonInit() {
        backgroundColor = UIColor.groupTableViewBackground
        setUpViews()
    }
    
    private func setUpViews() {
        
    }
    
    private func setUpCategoryImageView() {
        self.addSubview(categoryImageView)
        categoryImageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(90)
            make.leading.equalTo(5)
            make.top.equalTo(5)
        }
    }
    private func setUpCategoryNameLabel() {
        self.addSubview(categoryNameLabel)
        categoryNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.leading.equalTo(self.categoryImageView.snp.trailing).offset(20)
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-5)
        }
    }
    
    private func setUpFlashCardNumberLabel() {
        self.addSubview(numberOfCardsLabel)
        numberOfCardsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.categoryNameLabel.snp.bottom).offset(10)
            make.leading.equalTo(self.categoryImageView.snp.trailing).offset(20)
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-5)
        }
    }
    

}
