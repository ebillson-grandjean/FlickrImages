//
//  WebServiceManagerProtocol.swift
//  FlickrImages
//
//  Created by Ebillson Grand Jean on 1/15/25.
//

import Foundation



protocol WebServiceManagerProtocol {
    func fetchData<T: Decodable>(url: URL, type: T.Type) async throws -> T
}
