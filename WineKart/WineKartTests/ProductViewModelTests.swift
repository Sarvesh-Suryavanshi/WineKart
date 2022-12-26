//
//  ProductViewModelTests.swift
//  WineKartTests
//
//  Created by SI.SarveshSuryavansh on 26/12/22.
//

import XCTest
@testable import WineKart
import Combine

/// Creating a Stub APIManager for testing purpose
class StubAPIManager: APIManager {

    override func makeNetworkCall<T>(request: URLRequest, decodebleObject: T.Type, completion: @escaping ((Result<T, Error>) -> Void)) where T : Decodable, T : Encodable {
        guard let data = FileManager.shared.getLocalData(for: APIRequestProvider.productList.stubFileName) else { return }
        do {
            let productList = try JSONDecoder().decode(decodebleObject.self, from: data)
            completion(.success(productList))
        } catch(let error) {
            completion(.failure(error))
        }
    }
}

/// Testing Product View Model
class ProductViewModelTests: XCTestCase {

    var sut: ProductViewModel!
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.sut = ProductViewModel(apiManager: StubAPIManager())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.sut = nil
    }

    func testProductViewModel() throws {
        XCTAssertTrue(sut.products.isEmpty)

        let expectation = self.expectation(description: "Products Fetched")

        sut.$products
            .sink { products in
                guard !products.isEmpty else { return }
                expectation.fulfill()
            }.store(in: &cancellables)

        sut.getProducts()

        wait(for: [expectation], timeout: 1)

        XCTAssertTrue(!sut.products.isEmpty)
        XCTAssertEqual(sut.products.count, 2)
        XCTAssertTrue(!sut.favouriteProducts.isEmpty)
        XCTAssertEqual(sut.favouriteProducts.count, 1)
    }
}
