//
//  CardDetailView.swift
//  MarvelChampions
//
//  Created by Xavier Ramos on 10/5/23.
//

import SwiftUI

struct CardDetailView: View {
    
    @ObservedObject var viewModel: CardDetailViewModel
    
    init(viewModel: CardDetailViewModel) {
        
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Spacer().frame(height: 10)
            
            cardImage
            
            Spacer().frame(height: 10)
            
            description
            
            Spacer()
        }
        .padding([.leading, .trailing], 16)
        .navigationTitle(viewModel.getCardName())
    }
    
    @ViewBuilder
    var cardImage: some View {
        
        AsyncImage(url: URL(string: viewModel.card.imagesrc ?? "")) { image in
            
            image.resizable()
            
        } placeholder: {
            
            Color.gray
        }
        .aspectRatio(contentMode: .fit)
        .frame(height:300)
    }
    
    @ViewBuilder
    var description: some View {
        
        Text(viewModel.getCardDescription())
    }
}

struct CardDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let card = Card(id: "1",
                        packCode: "",
                        packName: "",
                        typeCode: "",
                        typeName: "",
                        factionCode: "",
                        factionName: "",
                        cardSetCode: nil,
                        cardSetName: nil,
                        linkedToCode: nil,
                        linkedToName: nil,
                        position: 0,
                        code: "",
                        name: nil,
                        realName: nil,
                        cost: nil,
                        text: nil,
                        realText: nil,
                        quantity: 0,
                        handSize: nil,
                        health: nil,
                        resourceEnergy: nil,
                        resourcePhysical: nil,
                        resourceMental: nil,
                        resourceWild: nil,
                        healthPerHero: false,
                        thwart: nil,
                        attack: nil,
                        defense: nil,
                        deckLimit: nil,
                        traits: nil,
                        realTraits: nil,
                        flavor: nil,
                        isUnique: false,
                        hidden: false,
                        permanent: false,
                        doubleSided: false,
                        imagesrc: "")
        CardDetailView(viewModel: CardDetailViewModel(card: card))
    }
}
