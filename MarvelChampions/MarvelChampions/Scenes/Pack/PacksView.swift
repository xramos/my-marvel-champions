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
            
            content
        }
        .onAppear {
            
            viewModel.getCards()
        }
    }
    
    @ViewBuilder
    private var content: some View {
        
        switch viewModel.state {
        case .empty(let message):
            InformationView(message: message)
        case .loading(let message):
            LoadingView(message: message)
        case .failure(let error):
            FailureView(error: error)
        case .loaded:
            loadedView()
        }
    }

    private func loadedView() -> some View {
        
        ScrollView {
            
            ForEach(viewModel.packs) { pack in
                
                NavigationLink(destination: CardsByCodeView(viewModel: CardsByCodeViewModel(code: pack.code))) {
                 
                    PackCellView(pack: pack)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct PacksView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PacksView(viewModel: PacksViewModel())
    }
}
