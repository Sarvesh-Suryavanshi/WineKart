//
//  APIManager.swift
//  WineKart
//
//  Created by SI.SarveshSuryavansh on 24/12/22.
//

import Foundation

/// This class is responsible for making API calls and returning the requested results to the requesting class.
class APIManager {

    static let shared = APIManager()

    func callAPI<T: Codable>(request: URLRequest, decodebleObject: T.Type, completion: @escaping ((Result<T, Error>) -> Void)) {

        URLSession.shared.dataTask(with: request) { data, urlResponse, error in

            if error != nil { completion(.failure(error!))}

            guard
                let data = data,
                let urlResponse = urlResponse as? HTTPURLResponse,
                urlResponse.isResponseOK()
            else {
                completion(.failure(error!))
                return
            }
            do {
                let response = try JSONDecoder().decode(decodebleObject.self, from: data)
                completion(.success(response))
            }
            catch {
                print(String(describing: error))
                completion(.failure(error))
            }
        }.resume()
    }
}

struct APIRequestDetails {
    let method: HTTPType
    let body: Data?
    let httpHeader: [String: String]?
}
