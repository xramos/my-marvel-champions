//
//  ServerPackUnitTests.swift
//  MarvelChampionsTests
//
//  Created by Xavi on 27/12/21.
//

import XCTest
@testable import MarvelChampions

class ServerPackUnitTests: XCTestCase {

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
        let serverPack = ServerPack(name: "name",
                                    code: "code",
                                    position: 1,
                                    available: "available",
                                    known: 1,
                                    total: 40)
        
        // When
        let response = serverPack.convertToEntity()
        
        // Then
        XCTAssertEqual(response.name, serverPack.name)
        XCTAssertEqual(response.code, serverPack.code)
        XCTAssertEqual(response.position, serverPack.position)
        XCTAssertEqual(response.available, serverPack.available)
        XCTAssertEqual(response.known, serverPack.known)
        XCTAssertEqual(response.total, serverPack.total)
    }
}
