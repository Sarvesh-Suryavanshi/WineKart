//
//  RatingView.swift
//  WineKart
//
//  Created by SI.SarveshSuryavansh on 26/12/22.
//

import SwiftUI

/// Displays Rating View based on rating input
struct RatingView: View {

    @State var rating: Double

    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { starNumber in
                Image(systemName: Int(round(rating)) > starNumber ? "star.fill": "star")
                    .foregroundColor( Int(round(rating)) > starNumber ? .yellow : .secondary)
            }
        }
    }
}

#if DEBUG
struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 5.0)
    }
}
#endif
