//
//  DBService+Category.swift
//  FlashTime
//
//  Created by C4Q on 2/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
extension DBService {
    func newCategory(name: String, byUser: String) {
        guard let currentUser = AuthUserService.getCurrentUser() else {print("could not get current user"); return}
        let ref = categoriesRef.childByAutoId()
        let category = Category(name: name, categoryID: ref.key, byUser: byUser, uID: currentUser.uid)
        ref.setValue(["name": category.name,
                      "categoryID": category.categoryID,
                      "uID": category.uID,
                      "byUser": category.byUser,
                      "cardCount": category.cardCount])
    }
}
