//
//  FlickerImagesListViewModel.swift
//  FlickrImages
//
//  Created by Ebillson Grand Jean on 1/15/25.
//

import Foundation
import Combine



enum MainViewStates {
    case load([ImageData])
    case error
}


final class FlickerImagesListViewModel: ObservableObject {
    
    @Published var mainViewStates = MainViewStates.load([])

    private var searchedWord = PassthroughSubject<String, Error>()
    private var repository: FlickerImageRepositoryProtocol
    private var anyCancellable = Set<AnyCancellable>()

    init(repository: FlickerImageRepositoryProtocol = FlickerImageRepository()) {
        self.repository = repository
        bindSearch()
    }
}


extension FlickerImagesListViewModel {
    
    
    func search(_ value: String) {
        searchedWord.send(value)
    }
    
    
    private func bindSearch() {
        
        searchedWord.debounce(for: 1.0, scheduler: DispatchQueue.main).sink { completed in
            print(completed)
        } receiveValue: { value in
            Task { [weak self] in
                await self?.fetchSearchedImagesWithText(searchTerm: value)
            }
        }.store(in: &anyCancellable)
        
    }

    @MainActor
    func fetchSearchedImagesWithText(searchTerm: String) async  {
        do {
            let imageData = try await repository.fetchFlickerImageData(withSearchTerm: searchTerm)
           // self.photosList = photoData.items
            mainViewStates = .load(imageData.items)
        } catch {
            mainViewStates = .error
        }
    }
    
}
