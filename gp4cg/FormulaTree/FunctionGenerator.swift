//
//  FunctionGenerator.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/03.
//

import Foundation

struct FunctionGenerator {
    private static let variables = (0...1).map { "X" + String($0) }
    private static let numbers = Array(1...5)
    private static let numChoices: [Parameter] = numbers + variables
    
    static func randomParameters(for count: Int) -> [Parameter] {
        Array((numChoices + embededNodes as [Parameter]).shuffled().prefix(count))
    }
    static func randomConstants(for count: Int) -> [Parameter] {
        Array((numChoices as [Parameter]).shuffled().prefix(count))
    }

    private static let embededNodes = Operator.operators.values.map { Node(op: $0) }
    
    static func generateIndividuals(for count: Int, depthRange: Range<Int>) -> [Individual] {
        (0..<count).map { _ in
            Individual(maxDepth: Int.random(in: depthRange))
        }
    }
}
