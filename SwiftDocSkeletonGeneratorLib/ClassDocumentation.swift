//
//  HelloWorld.swift
//  Lib
//
//  Created by Muis on 11/12/20.
//  Copyright © 2020 Muis. All rights reserved.
//

import Foundation
import SwiftSyntax


public final class ClassDocumentation: SyntaxRewriter {
    private let parsed: SourceFileSyntax
    
    // FIXME: better convenience init?
    init(_ source: String) throws {
        parsed = try SyntaxParser.parse(source: source)
    }
    
    init(_ syntax: SourceFileSyntax) {
        parsed = syntax
    }
    
    func rewrite() -> String {
        return "\(visit(parsed))"
    }
    
    public override func visit(_ node: ClassDeclSyntax) -> DeclSyntax {
        let docBlock = """
        /**
        */
        """
        
        let finalNode = node
            .withLeadingTrivia(Trivia
                .docBlockComment(docBlock)
                .appending(.newlines(1)))
        
        return super.visit(finalNode)
    }
}
