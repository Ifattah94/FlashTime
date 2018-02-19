//
//  DBService+AppUser.swift
//  FlashTime
//
//  Created by C4Q on 2/16/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
extension DBService {
    public func addAppUser(_ appUser: AppUser) {
        let ref = usersRef.child(appUser.uID)
        ref.setValue(["email": appUser.email,
                      "uID": appUser.uID,
                      "userName": appUser.userName])
    }
    
    func getAppUser(with uID: String, completion: @escaping (_ user: AppUser) -> Void) {
        let userRef = usersRef.child(uID)
        userRef.observeSingleEvent(of: .value) { (snapshot) in
            guard let email = snapshot.childSnapshot(forPath: "email").value as? String else {return}
            guard let userName = snapshot.childSnapshot(forPath: "userName").value as? String else {return}
            let currentAppUser = AppUser(userName: userName, email: email, uID: uID)
            completion(currentAppUser)
        }
    }
}
