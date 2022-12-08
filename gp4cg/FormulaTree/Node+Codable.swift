//
//  Node+Codable.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/08.
//

import Foundation

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
    let parameter: any Parameter
    
    private enum CodingKeys: String, CodingKey {
        case base, payload
    }
    
    private enum Base: Int, Codable {
        case int
        case string
        case node
    }
    
    init(_ parameter: any Parameter) {
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
