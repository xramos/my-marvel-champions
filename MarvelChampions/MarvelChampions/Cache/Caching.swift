//
//  Caching.swift
//  MarvelChampions
//
//  Created by Xavi on 23/12/21.
//

import Foundation

protocol Caching {
    
    /**
     Add key to cache
     */
    func add(key: String)
    
    /**
     Remove key from cache
     */
    func remove(key: String)
    
    /**
     Check if key extists in cache. true if exists, false otherwise
     */
    func exists(key: String) -> Bool
    
    /**
     Check if key with selected time is expired. true if  expired, false otherwise
     */
    func expired(key: String, time: Double) -> Bool
    
    /**
     Remove all keys from cache
     */
    func removeAll()
    
    /**
     Checks if cache for the specified key and cacheTime is available
     */
    func isAvailable(key: String, cacheTime: Double) -> Bool
}
