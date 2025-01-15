//
//  FlickerImageRepositoryStub.swift
//  FlickrImagesTests
//
//  Created by Ebillson Grand Jean on 1/15/25.
//

import Foundation
@testable import FlickrImages

class FlickerImagRepositoryStub: FlickerImageRepositoryProtocol  {
    
    func fetchFlickerImageData(withSearchTerm: String) async throws -> FlickerImageData {
        return FlickerImageData.images
    }
}


extension FlickerImageData {
    static var images: FlickerImageData {
        return FlickerImageData(title: "TestTitle", link: "TestLink", description: "TestDescription", modified: nil, generator: nil, items: [ImageData.getTestData()])
    }
}
