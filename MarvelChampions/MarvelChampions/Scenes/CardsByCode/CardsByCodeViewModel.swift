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
    
    @Published var state: CardsByCodeViewState = .empty(message: "No cards available")
    @Published public private(set) var cards: [Card] = []
    
    private var cardCancellable: AnyCancellable?
    
    // MARK: - Methods
    
    init(code: String) {
        
        self.code = code
    }
    
    func getCardsByCode() {
        
        self.state = .loading(message: "Loading!")
        
        cardCancellable = GetCardsByPackCodeUseCase().execute(code: code)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    self.state = .loaded
                case .failure(let error):
                    self.state = .failure(error: error.localizedDescription)
                }
                
            }, receiveValue: { (cards: [Card]) in
                
                self.cards = cards
            })
    }
}
