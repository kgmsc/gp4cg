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
        population.map {
            var root = $0.node
            let index = Int.random(in: 0..<root.endIndex)
            let branch = root[index]
            if let branch = branch as? Node {
                root[index] = Node(depth: branch.depth, maxDepth: $0.maxDepth)
            } else {
                root[index] = FunctionGenerator.random(for: 1, variety: [.Number, .Variable, .Recursion]).first!
            }
            return Individual(maxDepth: $0.maxDepth, node: root)
        }
    }
}
