//
//  RandomMutation.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

struct RandomMutation: Mutation {
    let teacherData: [[Int]]
    var description: String = "\tRandom Mutation"
    
    func exec(_ population: [Individual], generation: Int) -> [Individual] {
        // Int.random(in: 1...new.node.nodeCount - 1)
        //                    if param is Node {
        //                        params[i] = Node(depth: depth + 1, maxDepth: maxDepth)
        //                    } else {
        //                        params[i] = FunctionGenerator.random(for: 1, variety: [.Number, .Variable]).first!
        //                    }
        population.map {
            var root = $0.node
            let index = Int.random(in: 1...root.nodeCount)
            let branch = root[index]
            if let branch = branch as? Node {
                root[index] = Node(depth: branch.depth, maxDepth: $0.maxDepth)
            } else {
                root[index] = FunctionGenerator.random(for: 1, variety: [.Number, .Variable]).first!
            }
            return Individual(maxDepth: $0.maxDepth, node: root)
        }
    }
}
