//
//  ProductsView.swift
//  WineKart
//
//  Created by SI.SarveshSuryavansh on 25/12/22.
//

import SwiftUI

// name, price, and button to add to the cart.

struct ProductsListView: View {

    let title: String
    @EnvironmentObject var productViewModel: ProductViewModel

    var body: some View {
        NavigationView {
            List(productViewModel.products) { product in
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
            .onAppear {
                self.productViewModel.getProducts()
            }
        }.navigationViewStyle(.stack)
    }
}

#if DEBUG
struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView(title: Tab.wines.title).environmentObject(ProductViewModel())
    }
}
#endif
