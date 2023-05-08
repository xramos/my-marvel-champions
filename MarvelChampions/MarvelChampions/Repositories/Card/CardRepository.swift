//
//  CardRepository.swift
//  MarvelChampions
//
//  Created by Xavi on 28/12/21.
//

import Foundation
import Combine

protocol CardRepository {
    
    func getCards() -> AnyPublisher<[Card], Error>
    func getCardsByPackCode(code: String) -> AnyPublisher<[Card], Error>
}
