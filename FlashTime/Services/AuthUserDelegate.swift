//
//  AuthUserDelegate.swift
//  FlashTime
//
//  Created by C4Q on 2/16/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseAuth

@objc protocol AuthUserServiceDelegate: class {
   
    @objc optional func didLogin(_ authUserService: AuthUserService, appUser: AppUser)
    
    
    @objc optional func didFailLogin(_ authUserService: AuthUserService, error: String)
    
    
    @objc optional func didSignOut(_ authUserService: AuthUserService)
    
   
    @objc optional func didFailSignOut(_ authUserService: AuthUserService, error: String)
    
   
    @objc optional func didCreateUser(_ authUserService: AuthUserService, appUser: AppUser)
    
    
    @objc optional func didFailCreatingUser(_ authUserService: AuthUserService, error: String)
    
  
    @objc optional func didFailEmailVerification(_ authUserService: AuthUserService, user: User, error: String)
    
   
    @objc optional func didSendEmailVerification(_ authUserService: AuthUserService, user: User, message: String)
    
  
    @objc optional func didFailForgotPassword(_ authUserService: AuthUserService, error: String)
    
  
    
    @objc optional func didSendForgotPassword(_ authUserService: AuthUserService)
}
