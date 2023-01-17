//
//  Fork.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

/// A fork executes all of its operations in parallel, and returns the result of joining
/// the results of each operation.
struct Fork: GeneticOperation {
    let operations: [GeneticOperation]
    var description: String = "\tFork"
    
    func exec(_ population: [Individual], generation: Int) -> [Individual] {
        Array(operations.map {
            print("\t\($0)")
            return $0.exec(population, generation: generation)
        }.joined())
    }
}
