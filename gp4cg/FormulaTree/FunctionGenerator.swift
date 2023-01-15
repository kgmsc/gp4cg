//
//  FunctionGenerator.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/03.
//

import Foundation
import Algorithms

struct FunctionGenerator {
    private static let params: [ParameterViriety: [Parameter]] = [
        .Node: Operator.operators.values.map { Node(op: $0) },
        .Number: Array(1...3),
        .Variable: (0...1).map { "X" + String($0) },
        //.Recursion: (1...3).map { Recursion(changeValue: "X1", delta: $0)} //+ (1...3).map { Recursion(changeValue: "X0", delta: $0) }
    ]
    
    static func random(for count: Int, variety: [ParameterViriety]) -> [Parameter] {
        variety.flatMap{ params[$0]! }.randomSample(count: count)
    }
    
    enum ParameterViriety: String {
        case Variable
        case Number
        case Node
        //case Recursion
    }
}
