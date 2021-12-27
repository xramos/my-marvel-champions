//
//  DBPackUnitTests.swift
//  MarvelChampionsTests
//
//  Created by Xavi on 27/12/21.
//

import XCTest
@testable import MarvelChampions

class DBPackUnitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }

    func testConvertToEntity() {
     
        // Given
        let dbPack = DBPack(id: "1",
                            name: "name",
                            code: "code",
                            position: 1,
                            available: "available",
                            known: 1,
                            total: 40)
        
        // When
        let response = dbPack.convertToEntity()
        
        // Then
        XCTAssertEqual(response.id, dbPack.id)
        XCTAssertEqual(response.name, dbPack.name)
        XCTAssertEqual(response.code, dbPack.code)
        XCTAssertEqual(response.position, dbPack.position)
        XCTAssertEqual(response.available, dbPack.available)
        XCTAssertEqual(response.known, dbPack.known)
        XCTAssertEqual(response.total, dbPack.total)
    }
}
