//
//  HomeTableViewController.swift
//  FlashTime
//
//  Created by C4Q on 2/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    public var categories = [Category]() {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "CategoryCell")
        self.navigationItem.title = "Categories"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentNewCategoryVC))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(signOutButtonPressed))
        loadData()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    func loadData() {
        DBService.manager.getAllCategories { (categories) in
            self.categories = categories.reversed()
        }
    }
    @objc func presentNewCategoryVC() {
        let newCategoryVC = NewCategoryViewController()
        newCategoryVC.modalTransitionStyle = .crossDissolve
        newCategoryVC.modalPresentationStyle = .overFullScreen
        present(newCategoryVC, animated: true)
    }
    
    @objc func signOutButtonPressed() {
        //AuthUserService.logOut()
        AuthUserService.manager.logOut()
        //self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        self.dismiss(animated: false, completion: nil)
        let loginVC = LoginViewController.storyBoardInstance()
        //let navController =  UINavigationController(rootViewController: loginVC)
        present(loginVC, animated: true)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return categories.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryTableViewCell
        let category = categories[indexPath.row]
        cell.configureCell(with: category)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let selectedCell = tableView.cellForRow(at: indexPath) as! CategoryTableViewCell
        let selectedCategory = categories[indexPath.row]
        let flashCardsVC = FlashCardsViewController(category: selectedCategory)
        self.navigationController?.pushViewController(flashCardsVC, animated: true)
        
        
    }
  

}
