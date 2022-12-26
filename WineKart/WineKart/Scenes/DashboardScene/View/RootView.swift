//
//  ContentView.swift
//  WineKart
//
//  Created by SI.SarveshSuryavansh on 24/12/22.
//

import SwiftUI

/// View responsible for displaying products from api onto the screen
struct RootView: View {

    // MARK: - Properties
    @State var selectedTab: Tab = .wines
    @StateObject var productViewModel = ProductViewModel()

    // MARK: - Body UI
    var body: some View {
        VStack(spacing: 5.0) {
            let title = selectedTab.title
            switch selectedTab {
            case .wines:
                ProductsListView(title: title).environmentObject(productViewModel)
            case .favourite:
                FavouritesView(title: title).environmentObject(productViewModel)
            case .profile:
                ProfileView(title: title)
            case .cart:
                CartView(title: title)
            }

            TabBarView(selectedTab: $selectedTab)
        }
        .background(.thinMaterial)
        .ignoresSafeArea(edges: .bottom)
    }
}

#if DEBUG
struct RootView_Previews: PreviewProvider {
    @available(iOS 15.0, *)
    static var previews: some View {
        RootView(selectedTab: .wines)
    }
}
#endif
