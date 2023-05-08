//
//  CardCellView.swift
//  MarvelChampions
//
//  Created by Xavier Ramos on 8/5/23.
//

import SwiftUI

struct CardCellView: View {
    
    var card: Card
    
    init(card: Card) {
        
        self.card = card
    }
    
    var body: some View {
        
        VStack {
            
            Spacer().frame(height: 12)
            
            HStack {
                
                AsyncImage(url: URL(string: card.imagesrc ?? "")) { image in
                    
                    image.resizable()
                    
                } placeholder: {
                    
                    Color.gray
                }
                .aspectRatio(contentMode: .fit)
                .frame(height:50)
                .clipShape(RoundedRectangle(cornerRadius: 5))

                HStack {
                    
                    Text(card.name ?? "")
                    
                    Spacer()
                    
                    Text(card.factionName)
                        .foregroundColor(Color.gray)
                }
            }
                
            Spacer().frame(height: 10)
                
            Divider().frame(height: 2)
        }
        .padding([.leading, .trailing], 16)
    }
}

struct CardCellView_Previews: PreviewProvider {
    
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
        CardCellView(card: card)
    }
}
