//
//  PacksViewModel.swift
//  MarvelChampions
//
//  Created by Xavi on 23/12/21.
//

import Foundation
import Combine

class PacksViewModel: ObservableObject {
    
    // Values
    
    @Published var state: PacksViewState = .empty(message: "No packs available")
    @Published public private(set) var packs: [Pack] = []
    
    private var cardCancellable: AnyCancellable?
    private var packCancellable: AnyCancellable?
    
    // MARK: - Methods
    
    func getCards() {
        
        state = .loading(message: "Loading!")
        
        cardCancellable = GetCardsUseCase().execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    self.getPacks()
                case .failure(let error):
                    self.state = .failure(error: error.localizedDescription)
                }
                
            }, receiveValue: { (cards: [Card]) in
                
                //Nothing to do here
                print("")
            })
    }
    
    func getPacks() {
        
        packCancellable = GetPacksUseCase().execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    self.state = .loaded
                case .failure(let error):
                    self.state = .failure(error: error.localizedDescription)
                }
                
            }, receiveValue: { (packs: [Pack]) in
                
                self.packs = packs
            })
    }
}
