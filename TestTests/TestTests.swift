//
//  TestTests.swift
//  TestTests
//
//  Created by Prachit on 05/03/23.
//

import XCTest

@testable import Test

final class TestTests: XCTestCase {
    
    var sut : DummyEmptyProductVM!
    
    override func setUp() {
        super.setUp()
    }
    
    func testProductIsEmpty() {
        
        sut = DummyEmptyProductVM()
        sut.fetchData()
        
        sut.eventHandler = { event in
            switch event {
            case .loaded:
                XCTAssertEqual(self.sut.products.count , 1,"Empty")
                break
            default:
                break
            }
        }
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
}
