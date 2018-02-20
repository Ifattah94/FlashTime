//
//  DBService+FlashCard.swift
//  FlashTime
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseDatabase

extension DBService {
    public func newFlashCard(question: String, answer: String, categoryID: String) {
        guard let byUser = AuthUserService.getCurrentUser()?.displayName else {print("could not get current user"); return}
         guard let uID = AuthUserService.getCurrentUser()?.uid else {print("could not get current user"); return}
        let ref = flashCardsRef.childByAutoId()
        let flashCard = FlashCard(question: question, answer: answer, cardId: ref.key, categoryID: categoryID, byUser: byUser, uID: uID)
        ref.setValue(["categoryID": flashCard.categoryID,
                      "question": flashCard.question,
                      "answer": flashCard.answer,
                      "cardID": flashCard.cardID,
                      "uID": uID,
                      "byUser": byUser])
        print("new flashcard added")
        
    }
    
    public func getCardsFromCategory(from certainCategoryID: String, completion: @escaping (_ cards: [FlashCard]) -> Void) {
        flashCardsRef.observe(.value) { (dataSnapshots) in
            guard let flashCardData = dataSnapshots.children.allObjects as? [DataSnapshot] else {return}
            var flashCards = [FlashCard]()
            for flashCardSnapshot in flashCardData {
                guard let flashCardObject = flashCardSnapshot.value as? [String:Any] else {return}
                guard let categoryID = flashCardObject["categoryID"] as? String,
                let question = flashCardObject["question"] as? String,
                let answer = flashCardObject["answer"] as? String,
                let cardID = flashCardObject["cardID"] as? String,
                let byUser = flashCardObject["byUser"] as? String,
                let uID = flashCardObject["uID"] as? String
                else {return}
                
                if categoryID != certainCategoryID {
                    continue
                }
                let thisCard = FlashCard(question: question, answer: answer, cardId: cardID, categoryID: categoryID, byUser: byUser, uID: uID)
                flashCards.append(thisCard)
            }
            completion(flashCards)
        }
    }
    
    public func getCardsFromUsers(from certainUID: String, completion: @escaping (_ flashCards: [FlashCard]) -> Void) {
        flashCardsRef.observe(.value) { (dataSnapshots) in
            guard let flashCardData = dataSnapshots.children.allObjects as? [DataSnapshot] else {return}
            var flashCards = [FlashCard]()
            for flashCardSnapshot in flashCardData {
                guard let flashCardObject = flashCardSnapshot.value as? [String:Any] else {return}
                guard let cardID = flashCardObject["cardID"] as? String,
                let question = flashCardObject["question"] as? String,
                let answer = flashCardObject["answer"] as? String,
                let byUser = flashCardObject["byUser"] as? String,
                let uID = flashCardObject["uID"] as? String,
                let categoryID = flashCardObject["categoryID"] as? String
                else {return}
                
                if uID != certainUID {
                    continue
                }
                let thisCard = FlashCard(question: question, answer: answer, cardId: cardID, categoryID: categoryID , byUser: byUser, uID: uID)
                flashCards.append(thisCard)
            }
            completion(flashCards)
        }
    }
    public func getAllFlashCards(completion: @escaping (_ flashCards: [FlashCard]) -> Void) {
        flashCardsRef.observe(.value) { (dataSnapshots) in
            var flashCards: [FlashCard] = []
            guard let flashCardSnapshots = dataSnapshots.children.allObjects as? [DataSnapshot] else {return}
            for flashCardSnapshot in flashCardSnapshots {
                guard let flashCardObject = flashCardSnapshot.value as? [String: Any] else {return}
               guard let cardID = flashCardObject["cardID"] as? String,
                let question = flashCardObject["question"] as? String,
                let answer = flashCardObject["answer"] as? String,
                let byUser = flashCardObject["byUser"] as? String,
                let uID = flashCardObject["uID"] as? String,
                let categoryID = flashCardObject["categoryID"] as? String
                else {print("error getting flashCards");return}
                let thisFlashCard = FlashCard(question: question, answer: answer, cardId: cardID, categoryID: categoryID, byUser: byUser, uID: uID)
                flashCards.append(thisFlashCard)
            }
            completion(flashCards)
        }
    }
    
    
}
