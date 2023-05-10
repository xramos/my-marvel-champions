//
//  CardDetailViewModel.swift
//  MarvelChampions
//
//  Created by Xavier Ramos on 10/5/23.
//

import SwiftUI

class CardDetailViewModel: ObservableObject {
    
    var card: Card
    
    // MARK: - Methods
    
    init(card: Card) {
        
        self.card = card
    }
    
    func getCardName() -> String {
        
        card.name ?? ""
    }
    
    func getCardDescription() -> String {
        
        return card.realText ?? ""
    }
}
