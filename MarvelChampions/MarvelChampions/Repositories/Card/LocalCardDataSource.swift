//
//  LocalCardDataSource.swift
//  MarvelChampions
//
//  Created by Xavi on 28/12/21.
//

import Foundation

class LocalCardDataSource {
    
    private let dbManager: DBManager
    
    init(dbManager: DBManager = DBManager()) {
        
        self.dbManager = dbManager
        self.dbManager.configureDB()
    }
    
    func saveCard(card: Card) {
        
        dbManager.saveCard(card: card)
    }
    
    func getCards() -> [Card] {
        
        return dbManager.getCards()
    }
    
    func getCardsByPackCode(code: String) -> [Card] {
        
        return dbManager.getCardsByPackCode(code: code)
    }
}
