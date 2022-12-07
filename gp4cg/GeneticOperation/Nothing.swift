//
//  Nothing.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

struct Nothing: GeneticOperation {
    var description: String = "\tNothing"
    
    func exec(_ population: [Individual], generation: Int) -> [Individual] {
        population
    }
}
