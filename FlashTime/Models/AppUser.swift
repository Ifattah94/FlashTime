//
//  AppUser.swift
//  FlashTime
//
//  Created by C4Q on 2/16/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
class AppUser: NSObject {
    let userName: String
    let email: String
    let uID: String
    //TODO add scores etc.
    init(userName: String, email: String, uID: String) {
        self.userName = userName; self.email = email; self.uID = uID
    }
    
}
