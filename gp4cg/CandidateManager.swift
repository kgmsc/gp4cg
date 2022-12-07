//
//  CandidateManager.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

class CandidateManager {
    private(set) var candidates: Set<Individual> = []
    var uniquenessIndicator: (Individual, Individual) -> Bool
    
    init(uniquenessIndicator: @escaping (Individual, Individual) -> Bool) {
        self.uniquenessIndicator = uniquenessIndicator
    }
    
    func add(_ individuals: [Individual]) {
        for individual in individuals {
            if !candidates.contains(where: { uniquenessIndicator($0, individual) }) {
                candidates.insert(individual)
            }
        }
    }
    
    func candidates(teacherData: [[Int]]) -> [Individual] {
        let orderedCandidate = Array(candidates)
        let candidateMatches = candidates.map { $0.evaluation(teacherData) }
        var list: [Individual] = []
        var listMatches: [[Bool]] = []
        for (i, elem) in candidateMatches.enumerated() {
            if !listMatches.contains(where: { $0.contains(elem) }) {
                listMatches.append(elem)
                list.append(orderedCandidate[i])
            }
        }
        return list
    }
}
