//
//  DBService.swift
//  FlashTime
//
//  Created by C4Q on 2/16/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DBService: NSObject {
    
    private override init() {
        rootRef = Database.database().reference()
        usersRef = rootRef.child("users")
        categoriesRef = rootRef.child("categories")
        flashCardsRef = rootRef.child("flashCards")
        
    }
    static let manager = DBService()
    public weak var delegate: DBServiceDelegate?
    
    var rootRef: DatabaseReference!
    var usersRef: DatabaseReference!
    var categoriesRef: DatabaseReference!
    var flashCardsRef: DatabaseReference!
    
    
    public func checkUserNameExists(_ newName: String, currentUserID: String?, completion: @escaping (_ isTaken: Bool, _ oldName: String, _ newName: String) -> Void) {
        usersRef.observeSingleEvent(of: .value) { (dataSnapshot) in
            var oldName: String!
            
            for childSnapShot in dataSnapshot.children.allObjects as! [DataSnapshot] {
                
                guard let userDict = childSnapShot.value as? [String : Any] else {
                    return
                }
                guard
                    let displayName = userDict["userName"] as? String,
                    let userID = userDict["uID"] as? String
                    else {
                        return
                }
                if let currentUserID = currentUserID {
                    if userID == currentUserID {
                        oldName = displayName
                    }
                    if newName == displayName && currentUserID != userID {
                        completion(true, oldName, newName)
                        return
                    }
                } else {
                    if newName == displayName {
                        completion(true, oldName, newName)
                        return
                    }
                }
            }
            if let oldName = oldName {
                completion(false, oldName, newName)
                
                if let currentUserID = currentUserID {
                    self.usersRef.child(currentUserID).child("userName").setValue(newName, withCompletionBlock: { (error, _) in
                        if let error = error {
                            self.delegate?.didFailChangingUserName?(dbService: self, error: error.localizedDescription)
                        } else {
                            self.delegate?.didChangeUserName(dbService: self, oldName: oldName, newName: newName)
                        }
                    })
                }
                
                return
            } else {
                completion(false, newName, newName)
                return
            }
        }
    }
    
    
    
    
}
