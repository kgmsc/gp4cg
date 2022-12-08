//
//  TournamentSelection.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation
import Algorithms

struct TournamentSelection: Selection {
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
