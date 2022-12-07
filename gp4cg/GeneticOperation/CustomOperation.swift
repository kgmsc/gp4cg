//
//  CustomOperation.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

struct CustomOperation: GeneticOperation {
    var operation: ([Individual]) -> [Individual]
    var description: String
    func exec(_ population: [Individual], generation: Int) -> [Individual] {
        return operation(population)
    }
}
