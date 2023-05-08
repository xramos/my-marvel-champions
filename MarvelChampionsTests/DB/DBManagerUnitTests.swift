//
//  DBManagerUnitTests.swift
//  MarvelChampionsTests
//
//  Created by Xavi on 27/12/21.
//

import XCTest
@testable import MarvelChampions

class DBManagerUnitTests: XCTestCase {

    var sut: DBManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        sut = DBManager(storageType: .inMemory(identifier: "test"))
        sut.configureDB()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testSavePack() {
        
        // Given
        let pack = Pack(id: "1",
                        name: "name",
                        code: "code",
                        position: 1,
                        available: "available",
                        known: 1,
                        total: 40)
        
        // When
        sut.savePack(pack: pack)
        let response = sut.getPacks()
        
        // Then
        XCTAssertEqual(response.count, 1)
    }
    
    func testRemovePack() {
        
        // Given
        let pack = Pack(id: "1",
                        name: "name",
                        code: "code",
                        position: 1,
                        available: "available",
                        known: 1,
                        total: 40)
        
        // When
        sut.savePack(pack: pack)
        sut.removePack(pack: pack)
        let response = sut.getPacks()
        
        // Then
        XCTAssertEqual(response.count, 0)
    }
}
