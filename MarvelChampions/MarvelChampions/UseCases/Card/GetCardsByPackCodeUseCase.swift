//
//  GetCardsByPackCodeUseCase.swift
//  MarvelChampions
//
//  Created by Xavier Ramos on 8/5/23.
//

import Foundation
import Combine

class GetCardsByPackCodeUseCase {
    
    private let repository: CardRepository
    
    init(repository: CardRepository = CardRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(code: String) -> AnyPublisher<[Card], Error> {
        
        return repository.getCardsByPackCode(code: code)
    }
}
