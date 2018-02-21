//
//  FlashCardCollectionViewCell.swift
//  FlashTime
//
//  Created by C4Q on 2/20/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class FlashCardCollectionViewCell: UICollectionViewCell {
    
    
    lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "NoteCard")
        img.contentMode = .scaleToFill
        img.backgroundColor = .cyan
        return img
    }()
    
    lazy var textLabel: UILabel = {
        let lab = UILabel()
        return lab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        setupViews()
    }
    private func setupViews() {
       setupImageView()
       setupTextLabel()
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.height.equalTo(contentView.snp.height)
            
        }
    }
    private func setupTextLabel() {
        addSubview(textLabel)
        textLabel.snp.makeConstraints { (make) in
            make.center.equalTo(imageView.snp.center)
            make.height.equalTo(imageView.snp.height).multipliedBy(0.2)
            
        }
    }
    
}
