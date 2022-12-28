//
//  Individual.swift
//  gp4cg
//
//  Created by KeitoTanemura on 2022/11/10.
//

import Foundation

class Individual: Codable {
    let maxDepth: Int
    private(set) var node: Node
    private(set) var fitness: [String: Float] = [:]
    private var judgeResult: [Bool]?
    private var execResult: [Int: Int] = [:]
    
    init(maxDepth: Int) {
        self.maxDepth = maxDepth
        node = Node(op: Operator.random(), maxDepth: maxDepth)
        node.setRandomParams(isPriority: true)
    }
    
    init(maxDepth: Int, node: Node, fitness: [String: Float] = [:]) {
        self.maxDepth = maxDepth
        self.node = node
        self.fitness = fitness
    }
    
    private func array2param(_ array: [Int]) -> [String: Int] {
        [
            "X0": array[0],
            "X1": array[1]
        ]
    }
    
    func evaluation(values teacherData: [[Int]]) -> [Int] {
//        print(self)
        return teacherData.map {
//            print("===================", $0)
            let param = array2param($0)
            let result = execResult[param.hashValue]  ?? node.calculate(param, previousResults: execResult)
            execResult[param.hashValue] = result
            return result
        }
    }
    
    func evaluation(fitness fitnessFunction: Fitness) -> Float {
        let key = String(describing: type(of: fitnessFunction))
        let fitnessValue = fitness[key] ?? fitnessFunction.exec(evaluation(values: fitnessFunction.teacherData))
        fitness[key] = fitnessValue
        return fitnessValue
    }
    
    func evaluation(isCorrect teacherData: [[Int]]) -> [Bool] {
        judgeResult = judgeResult ?? evaluation(values: teacherData).enumerated().map {
            $0.element == teacherData[$0.offset][2]
        }
        return judgeResult!
    }
    
    func copy() -> Individual {
        Individual(maxDepth: maxDepth, node: node, fitness: fitness)
    }
    
    static func generate(for count: Int, depthRange: Range<Int>) -> [Individual] {
        (0..<count).map { _ in
            Individual(maxDepth: Int.random(in: depthRange))
        }
    }
}

extension Individual: CustomStringConvertible {
    var description: String {
        String(describing: "\(node) \(fitness)")
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
