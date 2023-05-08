//
//  PackRepositoryImplementationUnitTests.swift
//  MarvelChampionsTests
//
//  Created by Xavi on 27/12/21.
//

import XCTest
import Combine
@testable import MarvelChampions

class PackRepositoryImplementationUnitTests: XCTestCase {

    var sut: PackRepositoryImplementation?
    var cancellable: AnyCancellable?
    
    let baseUrlString = "http://jsonplaceholder.typicode.com/"
    let cache = Cache(type: CacheType.mock)
    
    let successStatusCode = 200
    let failureStatusCode = 401
    let timeoutTime: TimeInterval = 4
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        cache.removeAll()
        
        try super.tearDownWithError()
    }
    
    func testGetPacksOK() {
        
        // Given
        let session = getPacksSession(statusCode: successStatusCode)
        
        let remote = RemotePackDataSource(baseURL: baseUrlString,
                                          cache: cache,
                                          session: session)
        
        sut = PackRepositoryImplementation(remoteDataSource: remote)
        
        let exp = expectation(description: "expected values")
        
        // When
        cancellable = sut!.getPacks()
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    exp.fulfill()
                case .failure:
                    break
                }
            }, receiveValue: { packs in
                
                XCTAssertEqual(packs.count, 1)
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
    
    func testGetPacksError() {
        
        // Given
        let session = getPacksSession(statusCode: failureStatusCode)
        
        let remote = RemotePackDataSource(baseURL: baseUrlString,
                                          cache: cache,
                                          session: session)
        
        sut = PackRepositoryImplementation(remoteDataSource: remote)
        
        let exp = expectation(description: "expected values")
        
        // When
        cancellable = sut!.getPacks()
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case.failure:
                    exp.fulfill()
                }
            }, receiveValue: { packs in
                
                // Nothing to do
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
}

extension PackRepositoryImplementationUnitTests {
    
    func getPacksSession(statusCode: Int) -> URLSession {
        
        // URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/packs")
        
        // data we expect to recieve
        let data = getPacksData()
        
        // attach that to some fixed data in our protocol handler
        URLProtocolMock.testURLs = [url: data]
        URLProtocolMock.response = HTTPURLResponse(url: URL(string: "http://jsonplaceholder.typicode.com:8080")!,
                                                   statusCode: statusCode,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        
        // noew setup a configuration to use our mock
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        
        // and create the URLSession from that
        let session = URLSession(configuration: config)
        
        return session
    }
    
    func getPacksData() -> Data {
        
        let dataString = """
            [
            {
            "name": "name",
            "code": "code",
            "position": 1,
            "available": "available",
            "known": 1,
            "total": 40
            }
            ]
            """
        
        return Data(dataString.utf8)
    }
}
