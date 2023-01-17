//
//  Pick.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

/// This will return a new array of individuals that have been filtered by the filterFunction. The filterFunction will take an individual as a parameter and return a boolean value. This boolean value will determine whether or not the individual is added to the new array. 
/// The candidateManager will add all individuals that pass the filterFunction to the candidateManager's candidate pool.
struct Pick: GeneticOperation {
    let candidateManager: CandidateManager
    let filterFunction: (Individual) -> Bool
    var description: String = "\tPick"
    
    func exec(_ population: [Individual], generation: Int) -> [Individual] {
        candidateManager.add(population.filter(filterFunction))
        return population
    }
}
