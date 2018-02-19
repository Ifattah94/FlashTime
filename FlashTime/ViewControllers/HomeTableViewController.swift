//
//  HomeTableViewController.swift
//  FlashTime
//
//  Created by C4Q on 2/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Categories"
      
      
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 0
    }

  

}
