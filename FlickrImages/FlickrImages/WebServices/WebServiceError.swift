//
//  WebServiceError.swift
//  FlickrImages
//
//  Created by Ebillson Grand Jean on 1/15/25.
//

import Foundation



enum WebServiceError: Error {
    case dataNotFound
    case invalidURL
    case responseError(Int)
    case parsingError
}
