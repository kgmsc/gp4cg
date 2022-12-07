//
//  Pick.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

struct Pick: GeneticOperation {
    let candidateManager: CandidateManager
    let filterFunction: (Individual) -> Bool
    var description: String = "\tPick"
    
    func exec(_ population: [Individual], generation: Int) -> [Individual] {
        candidateManager.add(population.filter(filterFunction))
        return population
    }
}
