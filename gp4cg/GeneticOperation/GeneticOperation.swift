//
//  GeneticOperation.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/02.
//

import Foundation

protocol GeneticOperation: CustomStringConvertible {
    func exec(_ population: [Individual], generation: Int) -> [Individual]
}

protocol Selection: GeneticOperation {
    
}

protocol Mutation: GeneticOperation {
    
}
