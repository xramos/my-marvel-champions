//
//  PackUnitTests.swift
//  MarvelChampionsTests
//
//  Created by Xavi on 27/12/21.
//

import XCTest
@testable import MarvelChampions

class PackUnitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }

    func testConvertToDBEntity() {
        
        // Given
        let pack = Pack(id: "1",
                        name: "name",
                        code: "code",
                        position: 1,
                        available: "available",
                        known: 1,
                        total: 40)
        
        // When
        let response = pack.convertToDBEntity()
        
        // Then
        XCTAssertEqual(response.id, pack.id)
        XCTAssertEqual(response.name, pack.name)
        XCTAssertEqual(response.code, pack.code)
        XCTAssertEqual(response.position, pack.position)
        XCTAssertEqual(response.available, pack.available)
        XCTAssertEqual(response.known, pack.known)
        XCTAssertEqual(response.total, pack.total)
    }
}
