//
//  FakeWebServiceManager.swift
//  FlickrImagesTests
//
//  Created by Ebillson Grand Jean on 1/15/25.
//

import Foundation
@testable import FlickrImages

class FakeWebServiceManager: WebServiceManagerProtocol {
    var mockPath: String = ""

    func fetchData<T>(url: URL, type: T.Type) async throws -> T where T : Decodable {
        let bundle = Bundle(for: FakeWebServiceManager.self)
        guard let path = bundle.url(forResource: mockPath, withExtension: "json") else {
            throw WebServiceError.invalidURL
        }
        do {
            let data = try Data(contentsOf: path)
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            let parsedData = try jsonDecoder.decode(type, from: data)
            return parsedData
        } catch {
            throw WebServiceError.dataNotFound
        }
    }
}
