//
//  Node.swift
//  gp4cg
//
//  Created by KeitoTanemura on 2022/11/10.
//

import Foundation

struct Node {
    var op: Operator
    var params: [Parameter] = []
    var depth: Int = 0
    var maxDepth: Int = 1
    var nodeCount: Int = 1 // このノード以下のノードの数
    
    mutating func setRandomParams(isPriority: Bool = false) -> Int {
        if depth > maxDepth {
            fatalError()
        } else if depth == maxDepth {
            params = FunctionGenerator.randomConstants(for: op.arity)
        } else if isPriority {
            params = FunctionGenerator.randomParameters(for: op.arity)
            params[0] = Node(op: Operator.random())
        } else {
            params = FunctionGenerator.randomParameters(for: op.arity)
        }
        self.nodeCount = 1; //自分自身を含むので1
        for (i, param) in params.enumerated() {
            if var param = param as? Node {
                param.depth = depth + 1
                param.maxDepth = maxDepth
                // Max Depthまでの長さがほしいので,親がpriorityなら，子の最初のブランチは必ずpriorityにする
                nodeCount += param.setRandomParams(isPriority: isPriority ? i == 0 : false)
                params[i] = param
            }else{
                nodeCount += 1
            }
        }
        return nodeCount
    }
    
    private mutating func randomMutate() {
        self.op = Operator.random()
        self.params = []
        _ = self.setRandomParams(isPriority: true)
    }
    
    mutating func mutateBranch(position: Int) -> Int {
        var position = position
        if position == nodeCount {
            // 自分以下を変更
            self.randomMutate()
        } else {
            for (i, param) in params.enumerated() {
                if var param = param as? Node {
                    if position <= param.nodeCount {
                        let oldWeight = param.nodeCount
                        let newWeight = param.mutateBranch(position: position)
                        params[i] = param
                        nodeCount = nodeCount - oldWeight + newWeight
                        return nodeCount
                    } else {
                        position -= param.nodeCount
                        continue
                    }
                } else {
                    if position == 1 {
                        // 数字を変更
                        params[i] = FunctionGenerator.randomConstants(for: 1).first!
                        return self.nodeCount
                    } else {
                        position -= 1
                        continue
                    }
                }
            }
        }
        return nodeCount
    }
    
}

extension Node: CustomStringConvertible {
    var description: String {
        if op.arity == 2 {
            if let p1 = params[0] as? Int, let p2 = params[1] as? Int {
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
}

extension Node: Codable {
    enum CodingKeys: String, CodingKey {
        case op
        case params
        case depth
        case maxDepth
        case nodeCount
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        op = Operator.operators[try values.decode(String.self, forKey: .op)]!
        params = (try values.decode([ParameterWrapper].self, forKey: .params)).map { $0.parameter }
        depth = try values.decode(Int.self, forKey: .depth)
        maxDepth = try values.decode(Int.self, forKey: .maxDepth)
        nodeCount = try values.decode(Int.self, forKey: .nodeCount)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(op.name, forKey: .op)
        try container.encode(params.map { ParameterWrapper($0) }, forKey: .params)
        try container.encode(depth, forKey: .depth)
        try container.encode(maxDepth, forKey: .maxDepth)
        try container.encode(nodeCount, forKey: .nodeCount)
    }
}

fileprivate struct ParameterWrapper: Codable {
    let parameter: Parameter
    
    private enum CodingKeys: String, CodingKey {
        case base, payload
    }
    
    private enum Base: Int, Codable {
        case int
        case string
        case node
    }
    
    init(_ parameter: Parameter) {
        self.parameter = parameter
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let base = try container.decode(Base.self, forKey: .base)
        
        switch base {
        case .int:
            self.parameter = try container.decode(Int.self, forKey: .payload)
        case .string:
            self.parameter = try container.decode(String.self, forKey: .payload)
        case .node:
            self.parameter = try container.decode(Node.self, forKey: .payload)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch parameter {
        case let payload as Int:
            try container.encode(Base.int, forKey: .base)
            try container.encode(payload, forKey: .payload)
        case let payload as String:
            try container.encode(Base.string, forKey: .base)
            try container.encode(payload, forKey: .payload)
        case let payload as Node:
            try container.encode(Base.node, forKey: .base)
            try container.encode(payload, forKey: .payload)
        default:
            break
        }
    }
}
