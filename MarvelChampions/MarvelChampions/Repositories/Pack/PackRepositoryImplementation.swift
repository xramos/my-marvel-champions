//
//  PackRepositoryImplementation.swift
//  MarvelChampions
//
//  Created by Xavi on 23/12/21.
//

import Foundation
import Combine

class PackRepositoryImplementation: PackRepository {
    
    private let remoteDataSource: RemotePackDataSource
    private let localDataSource: LocalPackDataSource
    
    init(remoteDataSource: RemotePackDataSource = RemotePackDataSource(),
         localDataSource: LocalPackDataSource = LocalPackDataSource()) {
        
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func getPacks() -> AnyPublisher<[Pack], Error> {
        
        if remoteDataSource.isGetPacksCacheAvailable() {
            
            // Get packs from DDBB
            let packs = localDataSource.getPacks()
            
            return Result.Publisher(packs).eraseToAnyPublisher()
            
        } else {
            
            // Make network call
            return remoteDataSource.getPacks().map { serverPacks -> [Pack] in
                
                var packs: [Pack] = []
                
                // Convert soaentities to entities and save to Core Data
                for serverPack in serverPacks {
                    
                    let pack = serverPack.convertToEntity()
                    
                    self.localDataSource.savePack(pack: pack)
                    
                    packs.append(pack)
                }
                
                // Save Cache
                self.remoteDataSource.addGetPacksCache()
                
                // Return entities
                return packs
            }
            .mapError({ $0 })
            .eraseToAnyPublisher()
        }
    }
}
