//
//  PackCellView.swift
//  MarvelChampions
//
//  Created by Xavi on 23/12/21.
//

import SwiftUI

struct PackCellView: View {
    
    var pack: Pack
    
    init(pack: Pack) {
        self.pack = pack
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Spacer().frame(height: 12)
                
            packName
                
            Spacer()
                
            packCards
                
            Spacer().frame(height: 10)
                
            Divider().frame(height: 2)
        }
        .padding([.leading, .trailing], 16)
    }
    
    @ViewBuilder
    var packName: some View {
        
        Text(pack.name)
    }
    
    @ViewBuilder
    var packCards: some View {
        
        Text("\(pack.total) number of cards")
                .foregroundColor(Color.gray)
    }
}

struct PackCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let pack = Pack(id: "1",
                        name: "name",
                        code: "code",
                        position: 1,
                        available: "available",
                        known: 1,
                        total: 40)
        PackCellView(pack: pack)
    }
}
