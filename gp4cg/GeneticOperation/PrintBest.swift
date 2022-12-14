//
//  PrintBest.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

struct PrintBest: GeneticOperation {
    let sortFunction: (Individual, Individual) -> Bool
    var description: String = ""
    func exec(_ population: [Individual], generation: Int) -> [Individual] {
        if let min = population.min(by: sortFunction) {
            print("\tBest: \(min)")
        }
        return population
    }
}
