//
//  GetPacksUseCase.swift
//  MarvelChampions
//
//  Created by Xavi on 23/12/21.
//

import Foundation
import Combine

class GetPacksUseCase {
    
    private let repository: PackRepository
    
    init(repository: PackRepository = PackRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[Pack], Error> {
        
        return repository.getPacks()
    }
}
