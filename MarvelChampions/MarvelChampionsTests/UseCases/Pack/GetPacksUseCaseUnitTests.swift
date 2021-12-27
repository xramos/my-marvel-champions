//
//  GetPacksUseCaseUnitTests.swift
//  MarvelChampionsTests
//
//  Created by Xavi on 24/12/21.
//

import XCTest
@testable import MarvelChampions

class GetPacksUseCaseUnitTests: XCTestCase {

    var sut: GetPacksUseCase?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }

    func testExecuteIsCalled() {
        
        // Given
        let repository = MockPackRepository()
        sut = GetPacksUseCase(repository: repository)
        
        // When
        _ = sut?.execute()
        
        // Then
        XCTAssertTrue(repository.isGetPacksCalled)
    }
}
