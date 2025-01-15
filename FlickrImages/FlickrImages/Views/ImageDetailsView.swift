//
//  ImageDetailsView.swift
//  FlickrImages
//
//  Created by Ebillson Grand Jean on 1/15/25.
//

import SwiftUI

struct ImageDetailsView: View {
    @StateObject var imageDetailsVM: FlickerImageDetailsViewModel
    
    let width = UIScreen.main.bounds.size.width - 40
    
    init(image: ImageData) {
        self._imageDetailsVM = StateObject( wrappedValue: FlickerImageDetailsViewModel(image: image) )
    }

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageDetailsVM.image.media.m)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: UIScreen.main.bounds.size.height / 2)
            } placeholder: {
                ProgressView().frame(width: width, height: UIScreen.main.bounds.size.height / 2)
            }

            Text("Title: \(imageDetailsVM.image.title)")
                .font(.title)
                .frame(width: width, alignment: .leading)
                .padding(.horizontal, 20)
            WebView(html: imageDetailsVM.image.description)
                .frame(width: width, alignment: .leading)
                .padding(.horizontal, 20)
            Text("Author: \(imageDetailsVM.image.author)")
                .frame(width: width, alignment: .leading)
                .padding(.horizontal, 20)
            Text("Published: \(imageDetailsVM.published)")
                .frame(width: width, alignment: .leading)
                .padding(.horizontal, 20)
        }
        .navigationTitle(StringConstants.ImageDetailsNavTitle)
        .accessibilityElement()
        .accessibilityLabel(Text("\(imageDetailsVM.image.title) was taken by \(imageDetailsVM.image.author) and published on \(imageDetailsVM.published)"))
    }
}

#Preview {
    ImageDetailsView(image: ImageData.getTestData())
}
