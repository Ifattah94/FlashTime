//
//  FlashCard.swift
//  FlashTime
//
//  Created by C4Q on 2/16/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
class FlashCard: NSObject {
    let question: String
    let answer: String
    let cardID: String
    let categoryID: String
    let byUser: String
    let uID: String
    init(question: String, answer: String, cardId: String, categoryID: String, byUser: String, uID: String) {
        self.question = question; self.answer = answer; self.cardID = cardId; self.categoryID = categoryID; self.byUser = byUser; self.uID = uID
    }
    
}
