//
//  PackRepository.swift
//  MarvelChampions
//
//  Created by Xavi on 23/12/21.
//

import Foundation
import Combine

protocol PackRepository {
    
    func getPacks() -> AnyPublisher<[Pack], Error>
}
