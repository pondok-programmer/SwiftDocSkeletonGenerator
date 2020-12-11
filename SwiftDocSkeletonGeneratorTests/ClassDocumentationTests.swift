//
//  SwiftDocSkeletonGeneratorTests.swift
//  SwiftDocSkeletonGeneratorTests
//
//  Created by Muis on 11/12/20.
//  Copyright © 2020 Muis. All rights reserved.
//

import XCTest
@testable import SwiftDocSkeletonGeneratorLib

class ClassDocumentationTests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNoThrows() {
        let source = """
        class Foo {}
        """
        XCTAssertNoThrow(try ClassDocumentation(source))
    }

    func testDocumentationGenerator() {
        let source = """
        class Foo {}
        """
        
        let docGen = try! ClassDocumentation(source)
        let actualResult = docGen.rewrite()
        
        let expectedResult = """
        /**
        */
        \(source)
        """
        
        XCTAssertEqual(actualResult, expectedResult)
    }
}
