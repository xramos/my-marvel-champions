//
//  GetCardsUseCase.swift
//  MarvelChampions
//
//  Created by Xavi on 28/12/21.
//

import Foundation
import Combine

class GetCardsUseCase {
    
    private let repository: CardRepository
    
    init(repository: CardRepository = CardRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[Card], Error> {
        
        return repository.getCards()
    }
}
