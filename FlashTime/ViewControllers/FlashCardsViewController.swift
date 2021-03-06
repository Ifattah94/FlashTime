//
//  FlashCardsViewController.swift
//  FlashTime
//
//  Created by C4Q on 2/20/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class FlashCardsViewController: UIViewController {
var classIndexPath = IndexPath()
    
    var selectedIndexPath = 0
    let cellSpacing = UIScreen.main.bounds.size.width * 0.2
    let flashCardsView = FlashCardsView()
    var category: Category!
    var flashCards = [FlashCard]() {
        didSet {
            flashCardsView.collectionView.reloadData()
        }
    }
    
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
        view.addSubview(flashCardsView)
        loadFlashCards()
        configureNavBar()
        flashCardsView.collectionView.dataSource = self
        flashCardsView.collectionView.delegate = self

    }
    
    
   
    
    func configureNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showNewFlashCardVC))
    }
    @objc func showNewFlashCardVC() {
        let newFlashCardVC = NewFlashCardViewController(category: self.category)
        newFlashCardVC.modalTransitionStyle = .crossDissolve
        newFlashCardVC.modalPresentationStyle = .overCurrentContext
        present(newFlashCardVC, animated: true, completion: nil)
        
    }
    
    func loadFlashCards() {
        DBService.manager.getCardsFromCategory(from: category.categoryID) { (flashCardsFromDB) in
            self.flashCards = flashCardsFromDB
        }
    }

 

}

extension FlashCardsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flashCards.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = flashCardsView.collectionView.dequeueReusableCell(withReuseIdentifier: "FlashCardCell", for: indexPath) as! FlashCardCollectionViewCell
        let flashCard = flashCards[indexPath.row]
        cell.textLabel.text = flashCard.question
        return cell
    }
    
    
}

extension FlashCardsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numCells: CGFloat = 1
        let numSpaces: CGFloat = numCells + 1
        
        let width = ((UIScreen.main.bounds.width) - (numSpaces * cellSpacing)) / numCells
        let height = UIScreen.main.bounds.height * 0.40
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: cellSpacing, right: cellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}
extension FlashCardsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let cell = flashCardsView.collectionView.cellForItem(at: indexPath) as! FlashCardCollectionViewCell
             cell.textLabel.isHidden = true
        classIndexPath = indexPath
        UIView.animate(withDuration: 80.0, animations: {
            let animation = CABasicAnimation(keyPath: "transform.rotation.y")
            animation.delegate = self
            let angleRadian = CGFloat.pi
            animation.fromValue = 0
            animation.byValue = angleRadian
            animation.toValue = angleRadian
            animation.duration = 1.0
            animation.repeatCount = 1
            cell.imageView.layer.add(animation, forKey: nil)
            
            
        })
    }
    
    
}
extension FlashCardsViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let currentCard = flashCards[classIndexPath.row]
       let cell = flashCardsView.collectionView.cellForItem(at: classIndexPath) as! FlashCardCollectionViewCell
        cell.textLabel.isHidden = false
        if cell.textLabel.text == currentCard.question {
            cell.textLabel.text = currentCard.answer
        } else {
            cell.textLabel.text = currentCard.question
        }
        

    }
    func animationDidStart(_ anim: CAAnimation) {
        let cell = flashCardsView.collectionView.cellForItem(at: classIndexPath) as! FlashCardCollectionViewCell
        cell.textLabel.isHidden = true
    }
}

