//
//  FlickerImageRepository.swift
//  FlickrImages
//
//  Created by Ebillson Grand Jean on 1/15/25.
//

import Foundation



final class FlickerImageRepository {
    
    private let webService: WebServiceManagerProtocol
    
    
    init(webService: WebServiceManagerProtocol = WebServiceManager()) {
        self.webService = webService
    }
}


extension FlickerImageRepository: FlickerImageRepositoryProtocol {
    
    func fetchFlickerImageData(withSearchTerm: String) async throws -> FlickerImageData {
        
        guard let url = URL(string: "\(WebServiceEndPoints.BaseURL)\(WebServiceEndPoints.SearchPath)\(withSearchTerm)")else{
            throw WebServiceError.invalidURL
        }
        
        return try await webService.fetchData(url:url, type: FlickerImageData.self)
    }
}
