//
//  FlickerImageDetailsViewModel.swift
//  FlickrImages
//
//  Created by Ebillson Grand Jean on 1/15/25.
//

import Foundation



final class FlickerImageDetailsViewModel: ObservableObject {
    
    let image: ImageData
    
    var published: String {
        let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = dateFormatter.date(from: image.published) {
            dateFormatter.dateStyle = .long
            return dateFormatter.string(from: date)
        }
        else {
            return ""
        }
    }
    
    init(image: ImageData) {
        self.image = image
    }
    
}
