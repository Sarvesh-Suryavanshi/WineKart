//
//  ProductList.swift
//  WineKart
//
//  Created by SI.SarveshSuryavansh on 24/12/22.
//

import Foundation

typealias Products = [Product]

struct ProductList: Codable {
    let products: Products
}

struct Product: Codable, Identifiable {
    let citrusId: String?
    let title :String
    let id: String
    let imageURL: URL
    let price: [Price]
    let brand: String
    let badges: [URL]
    let ratingCount: Double
    let messages: Messages
    let isAddToCartEnable: Bool
    let addToCartButtonText : String
    let isInTrolley: Bool
    let isInWishlist: Bool
    let purchaseTypes: [PurchaseType]
    let isFindMeEnable: Bool
    let saleUnitPrice: Double
    let totalReviewCount: Int
    let isDeliveryOnly: Bool
    let isDirectFromSupplier: Bool
}

enum AddToCartButtonText: String, Codable {
    case addToCart = "Add to cart"
    case editQuantity = "Edit quantity"
}

// MARK: - Price
struct Price: Codable {
    let message: String
    let value: Double
    let isOfferPrice: Bool
}

enum Message: String, Codable {
    case inAnySix = "in any six"
    case perBottle = "per bottle"
}

// MARK: - Messages
struct Messages: Codable {
    let secondaryMessage: String?
    let promotionalMessage: String?
    let sash: Sash
}

// MARK: - Sash
struct Sash: Codable {
}

// MARK: - PurchaseType

struct PurchaseType: Codable {
    let purchaseType: String
    let displayName: DisplayName
    let unitPrice: Double
    let minQtyLimit: Int
    let maxQtyLimit: Int
    let cartQty: Int
}

enum DisplayName: String, Codable {
    case case6 = "case (6)"
    case each = "each"
    case perBottle = "per bottle"
    case perCaseOf6 = "per case of 6"
}
