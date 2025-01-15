//
//  FlickerImageRepostitoryTests.swift
//  FlickrImagesTests
//
//  Created by Ebillson Grand Jean on 1/15/25.
//

import XCTest
@testable import FlickrImages

final class FlickerImageRepostitoryTests: XCTestCase {

    var photoRepository: FlickerImageRepository!
    var webService: FakeWebServiceManager!
    
    override func setUpWithError() throws {
        webService = FakeWebServiceManager()
        photoRepository = FlickerImageRepository(webService: webService)
    }

    override func tearDownWithError() throws {
        webService = nil
        photoRepository = nil
    }

    func testGetPhotosData_success() async throws {
        // Given
        webService.mockPath = "ImagesTestData"
        
        // When
        let data = try await photoRepository.fetchFlickerImageData(withSearchTerm: "cat")
        
        //Then
        XCTAssertNotNil(webService)
        XCTAssertNotNil(photoRepository)
        XCTAssertEqual(data.items.count, 3)

    }
    
    func testGetListOfDigimon_whenNotExpectingData() async throws {
        // Given
        webService.mockPath = "ImagesTestWrongJsonData"
        
        do {
            // When
            let data = try await photoRepository.fetchFlickerImageData(withSearchTerm: "cat")
            
            // Then
            XCTAssertNotNil(webService)
            XCTAssertNotNil(photoRepository)
            XCTAssertEqual(data.items.count, 0)
        } catch {
            XCTAssertNotNil(error)
        }
    }
    
    func testGetListOfDigimon_whenExpectingNoData() async throws {
        // Given
        webService.mockPath = "ImagesTestDataNoData"
        
        do {
            // When
            let data = try await photoRepository.fetchFlickerImageData(withSearchTerm: "cat")
            
            // Then
            XCTAssertNotNil(webService)
            XCTAssertNotNil(photoRepository)
            XCTAssertEqual(data.items.count, 0)
        } catch {
            XCTAssertNotNil(error)
        }
    }

}
