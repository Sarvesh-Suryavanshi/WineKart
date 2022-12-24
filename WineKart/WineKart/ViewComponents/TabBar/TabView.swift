//
//  TabView.swift
//  WineKart
//
//  Created by SI.SarveshSuryavansh on 24/12/22.
//

import SwiftUI

/// View responsible for displaying Tab UI
struct TabView: View {

    // MARK: - Properties
    var tab: Tab
    var isTabSelected: Bool

    private var filledIconName: String {
        self.tab.rawValue + ".fill"
    }

    // MARK: - Body UI
    var body: some View {
        VStack(spacing: 10.0) {
            Image(systemName: self.isTabSelected ? self.filledIconName : tab.rawValue)
                .scaleEffect(self.isTabSelected ? 1.30 : 1.0)
                .font(.system(size: 18))
            Text(self.tab.title).font(.system(size: 12))
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView(tab: .wines, isTabSelected: true)
    }
}
