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
            
            ScrollView {
                
                ForEach(viewModel.cards) { card in
                    
                    CardCellView(card: card)
                }
            }
        }
        .onAppear {
            
            viewModel.getCardsByCode()
        }
    }
}

struct CardsByCodeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let model = CardsByCodeViewModel(code: "code")
        CardsByCodeView(viewModel: model)
    }
}
