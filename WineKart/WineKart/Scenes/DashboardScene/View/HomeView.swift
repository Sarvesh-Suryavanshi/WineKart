//
//  ContentView.swift
//  WineKart
//
//  Created by SI.SarveshSuryavansh on 24/12/22.
//

import SwiftUI

/// View responsible for displaying products from api onto the screen
struct HomeView: View {

    // MARK: - Properties
    @ObservedObject var homeViewModel: HomeViewModel
    @State var selectedTab: Tab = .wines

    // MARK: - Body UI
    var body: some View {
        VStack(spacing: 5.0) {
            Text("Hello, \(selectedTab.title)!")
                .padding()
            List(homeViewModel.products) { product in
                Text("\(product.title)")
            }
            TabBarView(selectedTab: $selectedTab)
        }
        .background(.thinMaterial)
        .onAppear {
            debugPrint("ScreenAppeared !!")
            homeViewModel.getProducts()
        }.ignoresSafeArea(edges: .bottom)
    }
}

struct HomeView_Previews: PreviewProvider {
    @available(iOS 15.0, *)
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel())
    }
}
