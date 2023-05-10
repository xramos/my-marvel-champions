//
//  CardsByCodeView.swift
//  MarvelChampions
//
//  Created by Xavier Ramos on 8/5/23.
//

import SwiftUI

struct CardsByCodeView: View {
    
    @ObservedObject var viewModel: CardsByCodeViewModel
    
    init(viewModel: CardsByCodeViewModel) {
        
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack {
            
            content
        }
        .onAppear {
            
            viewModel.getCardsByCode()
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
            
            ForEach(viewModel.cards) { card in
                
                NavigationLink(destination: CardDetailView(viewModel: CardDetailViewModel(card: card))) {
                 
                    CardCellView(card: card)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .navigationTitle("Cards")
    }
}

struct CardsByCodeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let model = CardsByCodeViewModel(code: "code")
        CardsByCodeView(viewModel: model)
    }
}
