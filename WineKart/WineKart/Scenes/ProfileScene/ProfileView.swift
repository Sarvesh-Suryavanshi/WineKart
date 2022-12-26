//
//  ProfileView.swift
//  WineKart
//
//  Created by SI.SarveshSuryavansh on 25/12/22.
//

import SwiftUI

struct ProfileView: View {
    
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
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(title: "Profile")
    }
}
#endif
