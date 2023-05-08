//
//  Pack.swift
//  MarvelChampions
//
//  Created by Xavi on 23/12/21.
//

import Foundation

struct Pack: Identifiable {
    
    let id: String
    let name: String
    let code: String
    let position: Int
    let available: String
    let known: Int
    let total: Int
    
    func convertToDBEntity() -> DBPack {
        
        return DBPack(id: id,
                      name: name,
                      code: code,
                      position: position,
                      available: available,
                      known: known,
                      total: total)
    }
}
