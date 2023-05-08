//
//  HTTPError.swift
//  MarvelChampions
//
//  Created by Xavi on 23/12/21.
//

import Foundation

enum HTTPError: LocalizedError, Equatable {
    case invalidResponse, invalidStatusCode
}
