//
//  Category.swift
//  FlashTime
//
//  Created by C4Q on 2/16/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
class Category: NSObject {
    let name: String
    var cardCount: Int = 0
    let byUser: String
    let categoryID: String
    let uID: String
    init(name: String, cardCount: Int, categoryID: String, byUser: String, uID: String) {
        self.name = name; self.cardCount = cardCount; self.categoryID = categoryID; self.byUser = byUser; self.uID = uID
    }
    init(name: String, categoryID: String, byUser: String, uID: String) {
        self.name = name; self.categoryID = categoryID; self.byUser = byUser; self.uID = uID
    }
    
}
