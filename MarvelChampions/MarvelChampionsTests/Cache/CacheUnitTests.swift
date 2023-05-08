//
//  CacheUnitTests.swift
//  MarvelChampionsTests
//
//  Created by Xavi on 27/12/21.
//

import XCTest
@testable import MarvelChampions

class CacheUnitTests: XCTestCase {

    var sut: Cache!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        sut = Cache(type: CacheType.mock)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut.removeAll()
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testAddKey() {
        
        // Given
        let path = "key1"
        
        // When
        sut.add(key: path)
        let response = sut.exists(key: path)
        
        // Then
        XCTAssertTrue(response)
    }
    
    func testRemoveKey() {
        
        // Given
        let path = "key1"
        
        // When
        sut.add(key: path)
        sut.remove(key: path)
        let response = sut.exists(key: path)
        
        // Then
        XCTAssertFalse(response)
    }
    
    func testExpiredKeyTrue() {
        
        // Given
        let path = "key1"
        let time = CacheTime.none.rawValue
        
        // When
        sut.add(key: path)
        let response = sut.expired(key: path, time: time)
        
        // Then
        XCTAssertTrue(response)
    }
    
    func testExpiredKeyFalse() {
        
        // Given
        let path = "key1"
        let time = CacheTime.short.rawValue
        
        // When
        sut.add(key: path)
        let response = sut.expired(key: path, time: time)
        
        // Then
        XCTAssertFalse(response)
    }
}
