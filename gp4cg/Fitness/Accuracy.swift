//
//  Accuracy.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

struct Accuracy: Fitness {
    let teacherData: [[Int]]
    
    func exec(_ individual: Individual) -> Float {
        Float(teacherData.filter {
            $0[2] == individual.calculate([
                "X0": $0[0],
                "X1": $0[1]
            ])
        }.count) / Float(teacherData.count)
    }
}
