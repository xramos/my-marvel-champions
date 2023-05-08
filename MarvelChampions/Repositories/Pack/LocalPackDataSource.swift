//
//  LocalPackDataSource.swift
//  MarvelChampions
//
//  Created by Xavi on 23/12/21.
//

import Foundation

class LocalPackDataSource {
    
    private let dbManager: DBManager
    
    init(dbManager: DBManager = DBManager()) {
        
        self.dbManager = dbManager
        self.dbManager.configureDB()
    }
    
    func savePack(pack: Pack) {
        
        dbManager.savePack(pack: pack)
    }
    
    func getPacks() -> [Pack] {
        
        return dbManager.getPacks()
    }
}
