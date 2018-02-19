//
//  AuthUserService.swift
//  FlashTime
//
//  Created by C4Q on 2/16/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthUserService: NSObject {
    private override init() {
        super.init()
        self.auth = Auth.auth()
    }
    public static func getCurrentUser() -> User? {
        return Auth.auth().currentUser
    }
    static let manager = AuthUserService()
    private var auth: Auth!
    weak public var delegate: AuthUserServiceDelegate?
    
    
    public func createAccount(withEmail email: String, userName: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                self.delegate?.didFailCreatingUser?(self, error: error.localizedDescription)
            } else if let user = user {
                user.sendEmailVerification(completion: { (error) in
                    if let error = error {
                        self.delegate?.didFailEmailVerification?(self, user: user, error: error.localizedDescription)
                    } else {
                        self.delegate?.didSendEmailVerification?(self, user: user, message: "A verification email has been sent. Please check your email and verify your account before logging in.")
                    }
                })
                let newAppUser = AppUser(userName: userName, email: email, uID: user.uid)
                DBService.manager.addAppUser(newAppUser)
                self.delegate?.didCreateUser?(self, appUser: newAppUser)
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = userName
                changeRequest.commitChanges(completion: { (error) in
                    if let error = error {
                        print("changeRequest error: \(error.localizedDescription)")
                    } else {
                        self.delegate?.didCreateUser?(self, appUser: newAppUser)
                        print("changeRequest was successful")
                    }
                })
            }
        }
    }
    
    public func login(withEmail email: String, andPassword password: String) {
        auth.signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                self.delegate?.didFailLogin?(self, error: error.localizedDescription)
            } else if let user = user {
                if !user.isEmailVerified {
                    self.delegate?.didFailEmailVerification?(self, user: user, error: "Your email is currently not verified. Please check your email and verify your account before proceeding.")
                    
                    self.logOut()
                }
                
                DBService.manager.getAppUser(with: user.uid, completion: { (appUser) in
                    self.delegate?.didLogin!(self, appUser: appUser)
                })
                print("Logged in")
            }
        }
    }
    
    public func logOut() {
        do {
            try Auth.auth().signOut()
            delegate?.didSignOut?(self)
        } catch {
            delegate?.didFailSignOut?(self, error: error.localizedDescription)
        }
    }
    
}
