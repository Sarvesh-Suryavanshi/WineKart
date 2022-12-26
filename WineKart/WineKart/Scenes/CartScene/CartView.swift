//
//  CartView.swift
//  WineKart
//
//  Created by SI.SarveshSuryavansh on 25/12/22.
//

import SwiftUI

struct CartView: View {
    
    let title: String
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Spacer()
            }
            .navigationTitle(title)
        }.navigationViewStyle(.stack)
    }
}

#if DEBUG
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(title: "Cart")
    }
}
#endif
