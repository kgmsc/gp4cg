//
//  SymbolicRegressor.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/01.
//

import Foundation
/// This is a class that is used to generate the symbolic regression model.
class SymbolicRegressor {

    /// The configuration object is used to set the parameters of the model.
    let configuration: SymbolicRegressorConfiguration

    /// The population is a list of individuals, each of which is a tree.
    var population: [Individual] = []

    /// The operations are the genetic operations applied to the individuals in the
    /// population.
    var operations: [GeneticOperation] = []
    
    init(configuration: SymbolicRegressorConfiguration) {
        /// This is the constructor that does not resume from a previous state.
        self.configuration = configuration
    }
    
    init(configuration: SymbolicRegressorConfiguration, resumptionPath: String) {
        /// This is the constructor that resumes from a previous state.
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
        /// This is the main function that performs the symbolic regression.
        for gen in 1...configuration.generations {
            /// The following block of code is executed for each generation.
            print("########## Generation \(gen)/\(configuration.generations)")
            population += Individual.generate(for: configuration.populationSize - population.count, depthRange: configuration.depthRange)
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
