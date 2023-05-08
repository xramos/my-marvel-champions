//
//  RemotePackDataSource.swift
//  MarvelChampions
//
//  Created by Xavi on 23/12/21.
//

import Foundation
import Combine

class RemotePackDataSource {
    
    static let getPacksURL: String = "packs"
    static let getPacksCacheTime: Double = CacheTime.long.rawValue
    
    private let baseURLString: String
    private let cache: Caching
    private let session: URLSession
    
    init(baseURL: String = Constants.baseURL, cache: Caching = Cache(type: CacheType.remote), session: URLSession = URLSession.shared) {
        
        self.baseURLString = baseURL
        self.cache = cache
        self.session = session
    }
    
    func getPacks() -> AnyPublisher<[ServerPack], Error> {
        
        let apiManager = ApiManager(baseURL: baseURLString,
                                    session: session)
        
        let urlRequest = getPacksEndpoint()
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
}

// MARK: - Endpoints

extension RemotePackDataSource {
    
    func getPacksEndpoint() -> URLRequest {
        
        let endpoint = "\(baseURLString)\(RemotePackDataSource.getPacksURL)"
        
        let url = URL(string: endpoint)
        
        let urlRequest = URLRequest(url: url!)
        
        return urlRequest
    }
}

// MARK: - Cache

extension RemotePackDataSource {
    
    func isGetPacksCacheAvailable() -> Bool {
        
        return cache.isAvailable(key: RemotePackDataSource.getPacksURL,
                                 cacheTime: RemotePackDataSource.getPacksCacheTime)
    }
    
    func addGetPacksCache() {
        
        cache.add(key: RemotePackDataSource.getPacksURL)
    }
}
