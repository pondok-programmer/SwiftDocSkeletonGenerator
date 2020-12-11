//
//  SwiftDocSkeletonGeneratorTests.swift
//  SwiftDocSkeletonGeneratorTests
//
//  Created by Muis on 11/12/20.
//  Copyright © 2020 Muis. All rights reserved.
//

import XCTest
@testable import SwiftDocSkeletonGeneratorLib

class EnumDocumentationTests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the enum.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the enum.
    }
    
    func testNoThrows() {
        let source = """
        enum Foo {}
        """
        XCTAssertNoThrow(try EnumDocumentation(source))
    }

    func testTopLevelEnum() {
        let source = """
        enum Foo {}
        """
        
        let docGen = try! EnumDocumentation(source)
        let actualResult = docGen.rewrite()
        
        let expectedResult = """
        /**
         # Foo Overview
         
         # Responsibility
         
         # Consideration
         
         */
        enum Foo {}
        """
        
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testNestedEnum() {
        let source = """
        enum Foo {
            
            enum Bar {}
            
        }
        """
        
        let docGen = try! EnumDocumentation(source)
        let actualResult = docGen.rewrite()
        
        let expectedResult = """
        /**
         # Foo Overview
         
         # Responsibility
         
         # Consideration
         
         */
        enum Foo {
            
            /**
             # Bar Overview
             
             # Responsibility
             
             # Consideration
             
             */
            enum Bar {}
            
        }
        """
        
        XCTAssertEqual(actualResult, expectedResult)
    }
}
