//
//  CardRepositoryImplementation.swift
//  MarvelChampions
//
//  Created by Xavi on 28/12/21.
//

import Foundation
import Combine

class CardRepositoryImplementation: CardRepository {
    
    private let remoteDataSource: RemoteCardDataSource
    private let localDataSource: LocalCardDataSource
    
    init(remoteDataSource: RemoteCardDataSource = RemoteCardDataSource(),
         localDataSource: LocalCardDataSource = LocalCardDataSource()) {
        
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    func getCards() -> AnyPublisher<[Card], Error> {
        
        if remoteDataSource.isGetCardsCacheAvailable() {
            
            // Get cards from DDBB
            let cards: [Card] = localDataSource.getCards()
            
            return Result.Publisher(cards).eraseToAnyPublisher()
            
        } else {
            
            // Make network call
            return remoteDataSource.getCards().map { serverCards -> [Card] in
                
                var cards: [Card] = []
                
                // Convert soaentities to entities and save to Core Data
                for serverCard in serverCards {
                    
                    let card = serverCard.convertToEntity()
                    
                    self.localDataSource.saveCard(card: card)
                    
                    cards.append(card)
                }
                
                // Save Cache
                self.remoteDataSource.addGetCardsCache()
                
                // Return entities
                return cards
            }
            .mapError({ $0 })
            .eraseToAnyPublisher()
        }
    }
    
    func getCardsByPackCode(code: String) -> AnyPublisher<[Card], Error> {
        
        if remoteDataSource.isGetCardsByPackCodeCacheAvailable(code: code) {
            
            // Get cards from DDBB
            let cards: [Card] = localDataSource.getCardsByPackCode(code: code)

            return Result.Publisher(cards).eraseToAnyPublisher()
            
        } else {
            
            // Make network call
            return remoteDataSource.getCardsByPackCode(code: code).map { serverCards -> [Card] in
                
                var cards: [Card] = []
                
                // Convert soaentities to entities and save to Core Data
                for serverCard in serverCards {
                    
                    let card = serverCard.convertToEntity()
                    
                    self.localDataSource.saveCard(card: card)
                    
                    cards.append(card)
                }
                
                // Save Cache
                self.remoteDataSource.addGetCardsByPackCache(code: code)

                // Return entities
                return cards
            }
            .mapError({ $0 })
            .eraseToAnyPublisher()
        }
    }
}
