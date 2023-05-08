//
//  PacksView.swift
//  MarvelChampions
//
//  Created by Xavi on 23/12/21.
//

import SwiftUI

struct PacksView: View {
    
    @StateObject var viewModel: PacksViewModel
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                
                ForEach(viewModel.packs) { pack in
                    
                    PackCellView(pack: pack)
                }
            }
        }
        .onAppear {
            
            //viewModel.getPacks()
            viewModel.getCards()
        }
    }
}

struct PacksView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PacksView(viewModel: PacksViewModel())
    }
}
