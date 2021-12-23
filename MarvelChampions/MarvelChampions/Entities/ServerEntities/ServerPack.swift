//
//  ServerPack.swift
//  MarvelChampions
//
//  Created by Xavi on 23/12/21.
//

import Foundation

struct ServerPack: Codable {
    
    let name: String
    let code: String
    let position: Int
    let available: String
    let known: Int
    let total: Int
    
    func convertToEntity() -> Pack {
        
        return Pack(id: UUID().uuidString,
                    name: name,
                    code: code,
                    position: position,
                    available: available,
                    known: known,
                    total: total)
    }
}
