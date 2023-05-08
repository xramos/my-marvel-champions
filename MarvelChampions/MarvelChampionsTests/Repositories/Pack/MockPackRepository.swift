//
//  MockPackRepository.swift
//  MarvelChampionsTests
//
//  Created by Xavi on 26/12/21.
//

import Foundation
import Combine
@testable import MarvelChampions

class MockPackRepository: PackRepository {
    
    var isGetPacksCalled = false
    
    func getPacks() -> AnyPublisher<[Pack], Error> {
        
        isGetPacksCalled = true
        
        let pack = Pack(id: "1",
                        name: "name",
                        code: "code",
                        position: 1,
                        available: "available",
                        known: 1,
                        total: 40)
        return Just([pack])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
