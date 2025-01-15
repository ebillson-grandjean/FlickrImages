//
//  WebServiceManager.swift
//  FlickrImages
//
//  Created by Ebillson Grand Jean on 1/15/25.
//

import Foundation



struct WebServiceManager {
    private let urlSession: URLSession
    init(urlSession: URLSession = URLSession.shared ) {
        self.urlSession = urlSession
    }
}


extension WebServiceManager: WebServiceManagerProtocol {
    
    
    func fetchData<T>(url: URL, type: T.Type) async throws -> T where T : Decodable {
        let (data, respone) = try await urlSession.data(from: url)
        guard let httpResponse = (respone as? HTTPURLResponse)else{
            throw WebServiceError.dataNotFound
        }
        guard (200...299).contains(httpResponse.statusCode) else{
            throw WebServiceError.responseError(httpResponse.statusCode)
        }
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try jsonDecoder.decode(type, from: data)
    }
}
