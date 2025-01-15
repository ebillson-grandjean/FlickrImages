//
//  FlickerImagesListViewModelTests.swift
//  FlickrImagesTests
//
//  Created by Ebillson Grand Jean on 1/15/25.
//

import XCTest

@testable import FlickrImages

final class FlickerImagesListViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown()  {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_FlickerImageListViewModel_fetchSearchedImagesWithText_imagesNotEmpty() async {
        // Given
        let sut = FlickerImagesListViewModel(repository: FlickerImagRepositoryStub())
        
        // when
        await sut.fetchSearchedImagesWithText(searchTerm: "test")

        // then
        XCTAssertEqual(sut.mainViewStates, MainViewStates.load(FlickerImageData.images.items))

    }


}


extension MainViewStates: @retroactive Equatable {
    public static func == (lhs: FlickrImages.MainViewStates, rhs: FlickrImages.MainViewStates) -> Bool {
        switch (lhs , rhs) {
        case (.load(let lhsItems), .load(let rhsItems)):
            return lhsItems.count == rhsItems.count
        case (.error , .error):
            return false
        case (.load(_), .error):
            return false
        case (.error, .load(_)):
            return false
        }
    }
}
