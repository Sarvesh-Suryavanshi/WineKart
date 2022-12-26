//
//  APIRequest.swift
//  WineKart
//
//  Created by SI.SarveshSuryavansh on 24/12/22.
//

import Foundation

enum HTTPType: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

enum APIEndpoint {

    private var baseURL: String {
        "https://run.mocky.io/v3"
    }

    case productList

    private var apiURL: URL? {
        switch self {
        case .productList:
            return URL(string: baseURL + "/2f06b453-8375-43cf-861a-06e95a951328")
        }
    }

    var stubFileName: String {
        switch self {
        case .productList:
            return "ProductsStubResponse"
        }
    }

    var request: URLRequest? {
        switch self {
        case .productList:
            guard let apiURL = apiURL else { return nil }
            var request = URLRequest(url: apiURL)
            request.httpMethod = HTTPType.get.rawValue
            return request
        }
    }
}

