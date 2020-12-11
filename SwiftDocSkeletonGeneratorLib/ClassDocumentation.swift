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
        var docBlock = """
        /**
         # ${IDENTIFIER} Overview
         
         # Responsibility
         
         # Consideration
         
         */
        """
        
        docBlock = docBlock.replacingOccurrences(
            of: "${IDENTIFIER}",
            with: node.identifier.text)
        
        let originalTrivia = node.leadingTrivia ?? Trivia.zero
        
        let indentSpace: Int = {
            guard originalTrivia.count > 0,
                case let .spaces(count) =
                originalTrivia[originalTrivia.count - 1]
                else {
                    return 0
            }
            return count
        }()
        
        docBlock = docBlock
            .replacingOccurrences(
                of: "\n",
                with: "\n\(String(repeating: " ", count: indentSpace))"
        )
        
        let docBlockTrivia = Trivia
            .docBlockComment(docBlock)
            .appending(.newlines(1))
        
        let finalTrivia = originalTrivia
            + docBlockTrivia
            + Trivia.spaces(indentSpace)
        
        let finalNode = node
            .withLeadingTrivia(finalTrivia)
        
        return super.visit(finalNode)
    }
}
