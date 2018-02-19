//
//  TabViewController.swift
//  FlashTime
//
//  Created by C4Q on 2/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeVC = HomeTableViewController()
        let quizVC = QuizViewController()
        let favoritesVC = FavoritesViewController()
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "icons8-home-32"), tag: 0)
       let firstNav = UINavigationController(rootViewController: homeVC)
        
        quizVC.tabBarItem = UITabBarItem(title: "Quiz", image: UIImage(named: "icons8-help-26"), tag: 1)
        let secondNav = UINavigationController(rootViewController: quizVC)
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "icons8-christmas-star-32"), tag: 2)
       let thirdNav = UINavigationController(rootViewController: favoritesVC)
        self.viewControllers = [firstNav, secondNav, thirdNav]

    }


    

    

}
