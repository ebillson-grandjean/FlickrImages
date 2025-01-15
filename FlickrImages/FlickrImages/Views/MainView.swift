//
//  ContentView.swift
//  FlickrImages
//
//  Created by Ebillson Grand Jean on 1/15/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var flickerImageListVM: FlickerImagesListViewModel = FlickerImagesListViewModel()
    @State var searchText:String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                switch flickerImageListVM.mainViewStates {
                case .load(let images):
                    showPhotosGrid(images: images)
                        .searchable(text: $searchText,placement: .automatic, prompt: StringConstants.SearchBarPrompt)
                        .onChange(of: searchText, initial: true) { searchText, newValue in
                            flickerImageListVM.search(newValue)
                        }
                case .error:
                    Text(StringConstants.ErrorLoadingPageMessage)
                }
            }
            .navigationTitle(StringConstants.MainViewNavTitle)
        }
    }
    
    @ViewBuilder
    func showPhotosGrid(images: [ImageData]) -> some View {
        SearchGridView(images: images)
    }
}

#Preview {
    MainView()
}
