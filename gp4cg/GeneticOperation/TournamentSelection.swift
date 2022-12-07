//
//  TournamentSelection.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

struct TournamentSelection: Selection {
    let sortFunction: (Individual, Individual) -> Bool
    let tournamentSize: Int
    var description: String = "\tTournament Selection"
    
    func exec(_ population: [Individual], generation: Int) -> [Individual] {
        let shuffledPopulation = population.shuffled()
        let tournament = shuffledPopulation.chunked(by: tournamentSize)
        print("\t\t\(tournament.count) tournaments")
        print("\t\t", terminator: "")
        
        let processes = tournament.chunked(by: 90)
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
