//
//  ProductViewModel.swift
//  WineKart
//
//  Created by SI.SarveshSuryavansh on 24/12/22.
//

import Foundation

/// Producat View Model
class ProductViewModel: ObservableObject {

    // MARK: - Properties

    // TODO: Instead of publishing entire products array, we need to publish a products display view model containing UI related details.
    @Published var products: Products = Products()
    let apiManager: APIManager
    var favouriteProducts: Products {
        return self.products.filter { $0.isInWishlist }
    }
    var exampleProduct: Product {
        Product(citrusId: "", title: "ProductTitle", id: "\(UUID())", imageURL: URL(string: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM")!, price: [], brand: "", badges: [], ratingCount: 3.0, messages: Messages.init(secondaryMessage: "", promotionalMessage: "", sash: Sash()), isAddToCartEnable: true, addToCartButtonText: .addToCart, isInTrolley: true, isInWishlist: true, purchaseTypes: [], isFindMeEnable: false, saleUnitPrice: 1.0, totalReviewCount: 1, isDeliveryOnly: true, isDirectFromSupplier: false)
    }

    // MARK: - Initializer
    init(apiManager: APIManager = APIManager.shared) {
        self.apiManager = apiManager
    }
}

// MARK: - ProductViewModel Extension

extension ProductViewModel {

    func getProducts() {
        if products.isEmpty {

            guard let request = APIEndpoint.productList.request else { return }
            apiManager.makeNetworkCall(request: request, decodebleObject: ProductList.self) {[weak self] result in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    switch result {
                    case .success(let products):
                        self.products = products.products
                    case .failure(let error):
                        debugPrint(error.localizedDescription)
                    }
                }
            }
        }
    }

    func toggleFavourite(for product: Product) {
        var productToUpdate = product
        productToUpdate.isInWishlist.toggle()

        if let index = products.firstIndex(where: { $0.id == productToUpdate.id }) {
            self.products[index] = productToUpdate
        }
    }
}
