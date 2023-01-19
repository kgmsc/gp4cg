//
//  TournamentSelection.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation
import Algorithms

/// This code defines the "TournamentSelection" class, which represents one of the selection algorithms, tournament selection. 
/// Tournament selection is a method of selecting the best individual from a fixed number of randomly selected individuals.
///This class has a sort function "sortFunction", a tournament size "tournamentSize", and "Tournament Selection" as "description".
///The "exec" method takes a given population "population" of individuals and a generation number "generation", executes the tournament selection, and returns a population of selected individuals. First, it shuffles the population and divides it into tournaments of different sizes. 
///Next, it selects the best individuals in those tournaments, after comparing them with the sortFunction function, and adds them to the population of selected individuals.
///Finally, a DispatchQueue is used to run many tournaments simultaneously.
struct TournamentSelection: Selection {
    /// sort function to determine the best individual in a tournament
    let sortFunction: (Individual, Individual) -> Bool
    let tournamentSize: Int
    var description: String = "\tTournament Selection"
    
    func exec(_ population: [Individual], generation: Int) -> [Individual] {
        let shuffledPopulation = population.shuffled()
        let tournament = Array(shuffledPopulation.chunks(ofCount: tournamentSize))
        print("\t\t\(tournament.count) tournaments")
        print("\t\t", terminator: "")
        
        let processes = tournament.chunks(ofCount: 90)
        let dispatchGroup = DispatchGroup()
        var selected: [Individual] = []
        for process in processes {
            DispatchQueue.global().async(group: dispatchGroup) {
                let selectedInProcess = process.compactMap { $0.min(by: sortFunction) }
                selected.append(contentsOf: selectedInProcess)
                print("*", terminator: "")
            }
        }
        dispatchGroup.wait()
        return selected
    }
}
