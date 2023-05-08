//
//  InformationView.swift
//  MarvelChampions
//
//  Created by Xavier Ramos on 8/5/23.
//

import SwiftUI

struct InformationView: View {
    
    var message: String
    
    init(message: String) {
        
        self.message = message
    }
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text(message)
            
            Spacer()
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        InformationView(message: "Information")
    }
}
