//
//  RandomMutation.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

/// This code generates an array of new individuals by randomly replacing a node with another node.
/// The node is chosen by picking a random index.
/// The new node can be a number or a variable, or a new node with a random function.
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
                root[index] = FunctionGenerator.random(for: 1, variety: [.Number, .Variable]).first!
            }
            return Individual(maxDepth: $0.maxDepth, node: root)
        }
    }
}
