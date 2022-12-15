//
//  Node.swift
//  gp4cg
//
//  Created by KeitoTanemura on 2022/11/10.
//

import Foundation

struct Node {
    typealias Element = Parameter
    typealias Index = Int
    
    var op: Operator
    var params: [any Element] = []
    var depth: Int = 0
    var maxDepth: Int = 1
    var nodeCount: Int = 1 // このノード以下のノードの数（1+1なら3，1+(1+1)なら5）
    
    var staticValue: Int? = nil
    
    init(op: Operator, maxDepth: Int = 1) {
        self.op = op
        self.maxDepth = maxDepth
    }
    
    init(depth: Int, maxDepth: Int) {
        self.depth = depth
        self.maxDepth = maxDepth
        op = Operator.random()
        params = []
        setRandomParams(isPriority: true)
    }
    
    mutating func setRandomParams(isPriority: Bool = false) {
        precondition(depth <= maxDepth)
        if depth == maxDepth {
            params = FunctionGenerator.random(for: op.arity, variety: [.Number, .Variable])
        } else if isPriority {
            params = [
                FunctionGenerator.random(for: 1, variety: [.Node]),
                FunctionGenerator.random(for: op.arity - 1, variety: [.Node, .Number, .Variable])
            ].flatMap { $0 }
        } else {
            params = FunctionGenerator.random(for: op.arity, variety: [.Node, .Number, .Variable])
        }
        self.nodeCount = 1; //自分自身を含むので1
        for (i, param) in params.enumerated() {
            if var param = param as? Node {
                param.depth = depth + 1
                param.maxDepth = maxDepth
                // Max Depthまでの長さがほしいので,親がpriorityなら，子の最初のブランチは必ずpriorityにする
                param.setRandomParams(isPriority: isPriority ? i == 0 : false)
                params[i] = param
            }
            nodeCount += params[i].nodeCount
        }
        
        let staticValues = params.compactMap { $0.staticValue }
        if staticValues.count == op.arity {
            staticValue = op.function(staticValues)
        } else {
            staticValue = nil
        }
    }
    
}

extension Node: CustomStringConvertible {
    var description: String {
        if op.arity == 2 {
            if let p1 = Int("\(params[0])"), let p2 = Int("\(params[1])") {
                return "\(op.function([p1, p2]))"
            } else {
                return "(\(params[0]) \(op.symbol) \(params[1]))"
            }
        } else {
            if let p = params[0] as? Int {
                return "\(op.function([p]))"
            } else {
                return "\(op.symbol)\(params[0])"
            }
        }
    }
    
    func toFunctionStyleString() -> String {
        if op.arity == 2 {
            if let p1 = Int("\(params[0])"), let p2 = Int("\(params[1])") {
                return "\(op.function([p1, p2]))"
            } else if op.name == "xor" {
                return "BitXor[\(params[0].toFunctionStyleString()),\(params[1].toFunctionStyleString())]"
            } else {
                return "(\(params[0].toFunctionStyleString()) \(op.symbol) \(params[1].toFunctionStyleString()))"
            }
        } else {
            if let p = params[0] as? Int {
                return "\(op.function([p]))"
            } else {
                return "\(op.symbol)\(params[0])"
            }
        }
    }
}

//extension Node: Hashable {
//    static func == (lhs: Node, rhs: Node) -> Bool {
//        lhs.op == rhs.op && lhs.params == rhs.params
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(op)
//        hasher.combine(params)
//    }
//}
