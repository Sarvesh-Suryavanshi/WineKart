//
//  ProductView.swift
//  WineKart
//
//  Created by SI.SarveshSuryavansh on 26/12/22.
//

import SwiftUI

struct ProductView: View {

    var product: Product
    @EnvironmentObject var productViewModel: ProductViewModel

    var body: some View {
        ZStack {
            self.productCardView
            ProductContentView(product: product)
        }
    }

    var productCardView: some View {
        VStack {
            Spacer()
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundColor(Color.init(hex: 0xF9A587))
                .frame(height: 150.0)
                .shadow(radius: 5)
        }
    }
}

#if DEBUG
struct ProductView_Previews: PreviewProvider {
    static var previews: some View {

        let productViewModel = ProductViewModel()
        ProductView(product: productViewModel.exampleProduct).environmentObject(ProductViewModel())
    }
}
#endif
