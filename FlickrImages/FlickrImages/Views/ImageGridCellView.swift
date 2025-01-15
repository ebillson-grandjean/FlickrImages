//
//  ImageGridCellView.swift
//  FlickrImages
//
//  Created by Ebillson Grand Jean on 1/15/25.
//

import SwiftUI

struct ImageGridCellView: View {
    let image: ImageData
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: image.media.m)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100,height: 100)
            } placeholder: {
                ProgressView().frame(width: 100,height: 100)
            }

            Text(image.title)
        }
    }
}

#Preview {
    ImageGridCellView(image: ImageData.getTestData())
}

