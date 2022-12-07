//
//  SymbolicRegressor.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/01.
//

import Foundation

class SymbolicRegressor {
    
    let configuration: SymbolicRegressorConfiguration
    var population: [Individual] = []
    var operations: [GeneticOperation] = []
    
    init(configuration: SymbolicRegressorConfiguration) {
        self.configuration = configuration
    }
    
    init(configuration: SymbolicRegressorConfiguration, resumptionPath: String) {
        self.configuration = configuration
        let url = URL(fileURLWithPath: resumptionPath)
        var importedPopulation: [Individual]
        do {
            importedPopulation = try JSONDecoder().decode([Individual].self, from: Data(contentsOf: url))
        } catch {
            fatalError(error.localizedDescription)
        }
        population = importedPopulation
    }
    
    func fit() {
        for gen in 1...configuration.generations {
            print("########## Generation \(gen)/\(configuration.generations)")
            population += FunctionGenerator.generateIndividuals(for: configuration.populationSize - population.count, depthRange: configuration.depthRange)
            for operation in operations {
                print(operation)
                let begin = Date()
                population = operation.exec(population, generation: gen)
                print("\tDone in \(Int(Date().timeIntervalSince(begin))) sec...")
            }
            print("########## Generation: \(gen)/\(configuration.generations)\tCarry Size: \(population.count)\n\n")
        }
    }
}
