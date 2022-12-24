//
//  HomeViewModel.swift
//  WineKart
//
//  Created by SI.SarveshSuryavansh on 24/12/22.
//

import Foundation

class HomeViewModel: ObservableObject {

    @Published var products: Products = []

    func getProducts() {
        guard let request = API.productList.request else { return }
        APIManager.shared.callAPI(request: request, decodebleObject: ProductList.self) {[weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    debugPrint(products)
                    self.products = products.products
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                }
            }
        }
    }
}
