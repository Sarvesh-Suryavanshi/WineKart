//
//  ProductContentView.swift
//  WineKart
//
//  Created by SI.SarveshSuryavansh on 26/12/22.
//

import SwiftUI

/// Displays Product Content View from Product Model
struct ProductContentView: View {

    let product: Product
    @EnvironmentObject var productViewModel: ProductViewModel

    var body: some View {
        HStack(alignment: .bottom, spacing: 15) {
            self.productImage
            VStack(alignment: .leading, spacing: 10) {
                GeometryReader { geo in
                    VStack(alignment: .leading, spacing: 5) {
                        self.titleView
                        self.favouriteAndRatingView
                        self.actionAndPriceView
                    }
                }
            }.frame(height: 150.0)
        }
    }


    /// Product Imgae View
    var productImage: some View {
        CachedAsyncImage(url: product.imageURL)
            .frame(width: 50.0)
            .padding(EdgeInsets(top: 0, leading: 15.0, bottom: 10, trailing: 0))
    }

    /// Product Title View
    var titleView: some View {
        Text("\(product.title)")
            .font(ProductFont.title)
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
    }

    /// Product Rating And Favourites View
    var favouriteAndRatingView: some View {
        HStack(spacing: 10) {

            RatingView(rating: product.ratingCount)
                .shadow(radius: 5)

            Spacer()

            FavouriteButton(isFavourite: product.isInWishlist)
                .onTapGesture {
                self.productViewModel.toggleFavourite(for: product)
            }

        }.frame(height: 45)
    }

    /// Action And Price  View
    var actionAndPriceView: some View {

        HStack(spacing: 10) {

            MessageView(message: product.addToCartButtonText.rawValue, backgroundColor: 0xD87280)
                .shadow(radius: 3)
                .onTapGesture {
                    // Do Action Here
                }

            Spacer()

            ForEach(product.price) { price in
                Text("\(Int(price.value))$ \(price.message)")
                    .padding()
                    .font(Font.system(size: 20))

            }
        }
    }
}

#if DEBUG
struct ProductContentView_Previews: PreviewProvider {
    static var previews: some View {
        let productViewModel = ProductViewModel()
        ProductContentView(product: productViewModel.exampleProduct).environmentObject(productViewModel)
    }
}
#endif

/// Responsible for displaying favourite button
struct FavouriteButton: View {

    var isFavourite: Bool
    var body: some View {
        Image(systemName: isFavourite ? "heart.fill" : "heart")
            .padding()
            .foregroundColor(.red)
            .scaleEffect( isFavourite ? 1.75 : 1.25)
    }
}
