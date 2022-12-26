//
//  TabBarView.swift
//  WineKart
//
//  Created by SI.SarveshSuryavansh on 24/12/22.
//

import SwiftUI

/// Enum representing App-Tabs
enum Tab: String, CaseIterable {
    case wines = "hand.point.up.left"
    case favourite = "heart"
    case profile = "person"
    case cart = "cart"

    /// This property provides tab display title
    var title: String {
        switch self {
        case .wines:
            return "Wines"
        case .favourite:
            return "Favourites"
        case .profile:
            return "Profile"
        case .cart:
            return "Cart"
        }
    }
}


/// Responsible for providing us Tab Bar View
struct TabBarView: View {

    // MARK: - Properties
    @Binding var selectedTab: Tab

    // MARK: - Body UI
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Spacer()
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Spacer()
                TabView(tab: tab, isTabSelected: self.selectedTab == tab)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)) {
                            selectedTab = tab
                        }
                    }
                Spacer()
            }
            Spacer()
        }
        .frame(width: nil, height: 80.0)
        .background(.thinMaterial)
        .cornerRadius(20.0)
        .shadow(radius: 8.0)
    }
}

#if DEBUG
struct TabBarView_Previews: PreviewProvider {

    @State static var selectedTab: Tab = .wines
    
    static var previews: some View {
        TabBarView(selectedTab: $selectedTab)
    }
}
#endif
