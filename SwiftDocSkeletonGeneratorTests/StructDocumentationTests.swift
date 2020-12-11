//
//  SwiftDocSkeletonGeneratorTests.swift
//  SwiftDocSkeletonGeneratorTests
//
//  Created by Muis on 11/12/20.
//  Copyright © 2020 Muis. All rights reserved.
//

import XCTest
@testable import SwiftDocSkeletonGeneratorLib

class StructDocumentationTests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the struct.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the struct.
    }
    
    func testNoThrows() {
        let source = """
        struct Foo {}
        """
        XCTAssertNoThrow(try StructDocumentation(source))
    }

    func testTopLevelStruct() {
        let source = """
        struct Foo {}
        """
        
        let docGen = try! StructDocumentation(source)
        let actualResult = docGen.rewrite()
        
        let expectedResult = """
        /**
         # Foo Overview
         
         # Responsibility
         
         # Consideration
         
         */
        struct Foo {}
        """
        
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testNestedStruct() {
        let source = """
        struct Foo {
            
            struct Bar {}
            
        }
        """
        
        let docGen = try! StructDocumentation(source)
        let actualResult = docGen.rewrite()
        
        let expectedResult = """
        /**
         # Foo Overview
         
         # Responsibility
         
         # Consideration
         
         */
        struct Foo {
            
            /**
             # Bar Overview
             
             # Responsibility
             
             # Consideration
             
             */
            struct Bar {}
            
        }
        """
        
        XCTAssertEqual(actualResult, expectedResult)
    }
}
