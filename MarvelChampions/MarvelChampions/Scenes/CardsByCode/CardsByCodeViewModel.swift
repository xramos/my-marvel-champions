//
//  CardsByCodeViewModel.swift
//  MarvelChampions
//
//  Created by Xavier Ramos on 8/5/23.
//

import Foundation
import Combine

class CardsByCodeViewModel: ObservableObject {
    
    var code: String
    
    // Values
    @Published public private(set) var cards: [Card] = []
    @Published public private(set) var showProgressView = false
    
    private var cardCancellable: AnyCancellable?
    
    // MARK: - Methods
    
    init(code: String) {
        
        self.code = code
    }
    
    func getCardsByCode() {
        
        showProgressView = true
        
        cardCancellable = GetCardsByPackCodeUseCase().execute(code: code)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: { (cards: [Card]) in
                
                self.cards = cards
            })
    }
}
