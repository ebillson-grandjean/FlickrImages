//
//  SearchGridView.swift
//  FlickrImages
//
//  Created by Ebillson Grand Jean on 1/15/25.
//

import SwiftUI

struct SearchGridView: View {
    var images: [ImageData]
    let colums: [GridItem] = [GridItem(.flexible(minimum: 100, maximum: 150)), GridItem(.flexible(minimum: 100, maximum: 150))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: colums,spacing: 10) {
                ForEach(images) { image in
                    NavigationLink {
                        ImageDetailsView(image: image)
                    } label: {
                        ImageGridCellView(image: image)
                    }

                }
            }
        }
    }
}

#Preview {
    SearchGridView(images: [])
}
