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

    func testTopLevelClass() {
        let source = """
        class Foo {}
        """
        
        let docGen = try! ClassDocumentation(source)
        let actualResult = docGen.rewrite()
        
        let expectedResult = """
        /**
         # Foo Overview
         
         # Responsibility
         
         # Consideration
         
         */
        class Foo {}
        """
        
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testNestedClass() {
        let source = """
        class Foo {
            
            class Bar {}
            
        }
        """
        
        let docGen = try! ClassDocumentation(source)
        let actualResult = docGen.rewrite()
        
        let expectedResult = """
        /**
         # Foo Overview
         
         # Responsibility
         
         # Consideration
         
         */
        class Foo {
            
            /**
             # Bar Overview
             
             # Responsibility
             
             # Consideration
             
             */
            class Bar {}
            
        }
        """
        
        XCTAssertEqual(actualResult, expectedResult)
    }
}
