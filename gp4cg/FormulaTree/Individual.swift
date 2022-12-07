//
//  Individual.swift
//  gp4cg
//
//  Created by KeitoTanemura on 2022/11/10.
//

import Foundation

class Individual: Codable,  {
    let maxDepth: Int
    private(set) var node: Node
    private(set) var fitness: [String: Float] = [:]
    private var judgeResult: [Bool]?
    
    init(maxDepth: Int) {
        self.maxDepth = maxDepth
        node = Node(op: Operator.random(), maxDepth: maxDepth)
        _ = node.setRandomParams(isPriority: true)
    }
    
    private init(maxDepth: Int, node: Node, fitness: [String: Float]) {
        self.maxDepth = maxDepth
        self.node = node
        self.fitness = fitness
    }
    
    func evaluation(_ fitnessFunction: Fitness) -> Float {
        let key = String(describing: type(of: fitnessFunction))
        let fitnessValue = fitness[key] ?? fitnessFunction.exec(self)
        fitness[key] = fitnessValue
        return fitnessValue
    }
    
    func evaluation(_ teacherData: [[Int]]) -> [Bool] {
        if judgeResult == nil {
            judgeResult = teacherData.map {
                calculate([
                    "X0": $0[0],
                    "X1": $0[1]
                ]) == $0[2]
            }
        }
        return judgeResult!
    }
    
    func copy() -> Individual {
        Individual(maxDepth: maxDepth, node: node, fitness: fitness)
    }
    
    func mutated() -> Individual {
        let new = Individual(maxDepth: maxDepth, node: node, fitness: [:])
        _ = new.node.mutateBranch(position: Int.random(in: 1...new.node.nodeCount - 1))
        return new
    }
    
    func calculate(_ localParameters: [String: Int]) -> Int {
        return node.calculate(localParameters)
    }
}

extension Individual: CustomStringConvertible {
    var description: String {
        String(describing: node)
    }
}

extension Individual: Hashable {
    static func == (lhs: Individual, rhs: Individual) -> Bool {
        lhs.description == rhs.description
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(description)
    }
}
