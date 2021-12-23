//
//  Persistence.swift
//  MarvelChampions
//
//  Created by Xavi on 23/12/21.
//

import Foundation

protocol Persistence {
    
    func savePack(pack: Pack)
    
    func removePack(pack: Pack)
    
    func getPacks() -> [Pack]
}
