//
//  RandomMutation.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

struct RandomMutation: Mutation {
    let teacherData: [[Int]]
    var description: String = "\tRandom Mutation"
    
    func exec(_ population: [Individual], generation: Int) -> [Individual] {
        population.map { $0.mutated() }
    }
}
