//
//  DBServiceDelegate.swift
//  FlashTime
//
//  Created by C4Q on 2/16/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
@objc protocol DBServiceDelegate: class {
    @objc func didChangeUserName(dbService: DBService, oldName: String, newName: String)
    
    @objc optional func didFailChangingUserName(dbService: DBService, error: String)
    
    @objc optional func didFailAddingAppUser(dbService: DBService, error: String)
    
    @objc optional func didGetUserCategories(dbService: DBService, categories: [Category])
    
    @objc optional func didFailGettingUserCategories(dbService:DBService, error: String)
    
    @objc optional func didGetFlashCardsFromCategory(dbService: DBService, flashCards: [FlashCard])
    
    @objc optional func didFailGettingFlashCardsFromCategory(dbService: DBService, error: String)
    
    @objc optional func didAddCategory(dbService: DBService, category: Category)
    
    @objc optional func didFailAddingCategory(dbService: DBService, error: String)
    
    @objc optional func didAddFlashCard(dbService: DBService, flashCard: FlashCard)
    
    @objc optional func didFailAddingFlashCard(dbService: DBService, error: String)
    
    
    
    
    
    
}

