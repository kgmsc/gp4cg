//
//  PrintBest.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

/// This code is a genetic operation that prints the best individual in a population.
/// The best individual is determined by the sort function passed in to the constructor.
func exec(_ population: [Individual], generation: Int) -> [Individual] {
    if let min = population.min(by: sortFunction) {
        print("\tBest: \(min)")
    }
    return population
}

