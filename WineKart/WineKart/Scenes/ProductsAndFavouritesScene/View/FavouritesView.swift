//
//  FavouritesView.swift
//  WineKart
//
//  Created by SI.SarveshSuryavansh on 25/12/22.
//

import SwiftUI

struct FavouritesView: View {

    let title: String
    @EnvironmentObject var productViewModel: ProductViewModel

    var body: some View {
        NavigationView {
            if !productViewModel.favouriteProducts.isEmpty {
                List(productViewModel.favouriteProducts) { product in
                    NavigationLink(destination: Text("DetailsView")) {
                        Section {
                            ProductView(product: product)
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .ignoresSafeArea(edges: .bottom)
                .navigationTitle(title)
            } else {
                MessageView(message: "There are no favourites 🤎 to display.", backgroundColor: 0xDFAFA4)
                    .navigationTitle(title)
            }
        }.navigationViewStyle(.stack)
    }
}

#if DEBUG
struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView(title: Tab.favourite.title).environmentObject(ProductViewModel())
    }
}
#endif

struct MessageView: View {

    var message: String
    var backgroundColor: UInt
    var font: Font = ProductFont.subTitle
    // var titleColor: UInt

    var body: some View {
        Text(message)
            .font(font)
            .padding(5.0)
            .foregroundColor(.white)
            .background(Color.init(hex: backgroundColor))
            .cornerRadius(5.0)
    }
}
