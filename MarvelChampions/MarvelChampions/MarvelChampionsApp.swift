//
//  MarvelChampionsApp.swift
//  MarvelChampions
//
//  Created by Xavi on 23/12/21.
//

import SwiftUI

@main
struct MarvelChampionsApp: App {

    var body: some Scene {
        
        WindowGroup {
            
            NavigationView {
                
                PacksView(viewModel: PacksViewModel())
            }
        }
    }
}
