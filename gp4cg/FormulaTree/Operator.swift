//
//  Operator.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

struct Operator {
    var function: ([Int]) -> Int
    var name: String
    var symbol: String
    var arity: Int // 引数の数
    
    static let operators = [
        "mod": Operator(function: {
            if $0[1] == 0 {
                return 0
            } else {
                return $0[0] % $0[1]
            }
        }, name: "mod", symbol: "+", arity: 2),
        "xor": Operator(function: {
            $0[0] ^ $0[1]
        }, name: "xor", symbol: "⊕", arity: 2),
        "minus": Operator(function: {
            -$0[0]
        }, name: "minus", symbol: "-", arity: 1),
        "add": Operator(function: {
            $0[0] + $0[1]
        }, name: "add", symbol: "+", arity: 2),
        "sub": Operator(function: {
            $0[0] - $0[1]
        }, name: "sub", symbol: "-", arity: 2),
        "mul": Operator(function: {
            $0[0] * $0[1]
        }, name: "mul", symbol: "×", arity: 2),
        "div": Operator(function: {
            if $0[1] == 0 {
                return 1
            } else {
                return $0[0] / $0[1]
            }
        }, name: "div", symbol: "/", arity: 2)
    ]
    
    static func random() -> Operator {
        operators.values.randomElement()!
    }
    
}

extension Operator: Hashable {
    static func == (lhs: Operator, rhs: Operator) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
