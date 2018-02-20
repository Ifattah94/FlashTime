//
//  DBService+Category.swift
//  FlashTime
//
//  Created by C4Q on 2/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseDatabase

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
    
    public func getAllCategories(completion: @escaping (_ categories: [Category]) -> Void) {
        categoriesRef.observe(.value) { (dataSnapshot) in
            var categories: [Category] = []
            guard let categorySnapshots = dataSnapshot.children.allObjects as? [DataSnapshot] else {return}
            for categorySnapshot in categorySnapshots {
                guard let categoryObject = categorySnapshot.value as? [String:Any] else {return}
                guard let name = categoryObject["name"] as? String,
                let categoryID = categoryObject["categoryID"] as? String,
                let uID = categoryObject["uID"] as? String,
                let byUser = categoryObject["byUser"] as? String,
                let cardCount = categoryObject["cardCount"] as? Int
                    else {print("error getting categories");return}
                let thisCategory = Category(name: name, cardCount: cardCount, categoryID: categoryID, byUser: byUser, uID: uID)
                categories.append(thisCategory)
                completion(categories)
            }
        }
    }
    public func getCategoriesFromCurrentUser(fromUID uID: String, completion: @escaping ([Category]) -> Void) {
        getAllCategories { (categories) in
            let userCategories = categories.filter({$0.uID == uID})
            completion(userCategories)
        }
    }
}
