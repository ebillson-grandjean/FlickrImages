//
//  FlickerRepositoryProtocol.swift
//  FlickrImages
//
//  Created by Ebillson Grand Jean on 1/15/25.
//

import Foundation



protocol FlickerImageRepositoryProtocol {
    
    func fetchFlickerImageData(withSearchTerm: String) async throws -> FlickerImageData
    
}
