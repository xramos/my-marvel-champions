//
//  FailureView.swift
//  MarvelChampions
//
//  Created by Xavier Ramos on 8/5/23.
//

import SwiftUI

struct FailureView: View {
    
    var error: String
    
    init(error: String) {
        
        self.error = error
    }
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text(error)
            
            Spacer()
        }
    }
}

struct FailureView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        FailureView(error: "Failed!!!")
    }
}
