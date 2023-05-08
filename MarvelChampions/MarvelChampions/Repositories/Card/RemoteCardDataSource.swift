//
//  RemoteCardDataSource.swift
//  MarvelChampions
//
//  Created by Xavi on 28/12/21.
//

import Foundation
import Combine

class RemoteCardDataSource {
    
    static let getCardsURL: String = "cards"
    static let getCardsCacheTime: Double = CacheTime.long.rawValue
    
    private let baseURLString: String
    private let cache: Caching
    private let session: URLSession
    
    init(baseURL: String = Constants.baseURL, cache: Caching = Cache(type: CacheType.remote), session: URLSession = URLSession.shared) {
        
        self.baseURLString = baseURL
        self.cache = cache
        self.session = session
    }
    
    func getCards() -> AnyPublisher<[ServerCard], Error> {
        
        let apiManager = ApiManager(baseURL: baseURLString,
                                    session: session)
        
        let urlRequest = getCardsEndpoint()
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
    
    func getCardsByPackCode(code: String) -> AnyPublisher<[ServerCard], Error> {
        
        let apiManager = ApiManager(baseURL: baseURLString,
                                    session: session)
        
        let urlRequest = getCardsByPackCodeEndpoint(code: code)
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
}

// MARK: - Endpoints

extension RemoteCardDataSource {
    
    func getCardsEndpoint() -> URLRequest {
        
        let endpoint = "\(baseURLString)\(RemoteCardDataSource.getCardsURL)"
        
        let url = URL(string: endpoint)
        
        let urlRequest = URLRequest(url: url!)
        
        return urlRequest
    }
    
    func getCardsByPackCodeEndpoint(code: String) -> URLRequest {
        
        let endpoint = "\(baseURLString)\(RemoteCardDataSource.getCardsURL)/\(code)"
        
        let url = URL(string: endpoint)
        
        let urlRequest = URLRequest(url: url!)
        
        return urlRequest
    }
}

// MARK: - Cache

extension RemoteCardDataSource {
    
    func isGetCardsCacheAvailable() -> Bool {
        
        return cache.isAvailable(key: RemoteCardDataSource.getCardsURL,
                                 cacheTime: RemoteCardDataSource.getCardsCacheTime)
    }
    
    func addGetCardsCache() {
        
        cache.add(key: RemoteCardDataSource.getCardsURL)
    }
    
    func isGetCardsByPackCodeCacheAvailable(code: String) -> Bool {
        
        let key = "\(RemoteCardDataSource.getCardsURL)/\(code)"
        
        return cache.isAvailable(key: key,
                                 cacheTime: RemoteCardDataSource.getCardsCacheTime)
    }
    
    func addGetCardsByPackCache(code: String) {
        
        let key = "\(RemoteCardDataSource.getCardsURL)/\(code)"
        
        cache.add(key: key)
    }
}
