//
//  CardsByCodeViewState.swift
//  MarvelChampions
//
//  Created by Xavier Ramos on 8/5/23.
//

import Foundation

enum CardsByCodeViewState: Equatable {
    
    case empty(message: String)
    case loading(message: String)
    case failure(error: String)
    case loaded
}
