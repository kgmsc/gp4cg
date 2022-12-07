//
//  MeanSquareError2d.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

struct MeanPowError2d: Fitness {
    let teacherData: [[Int]]
    var power: Float = 2.0
    
    func exec(_ individual: Individual) -> Float {
        let total = teacherData.reduce(Float.zero) {
            $0 + pow(Float($1[2] - individual.calculate([
                "X0": $1[0],
                "X1": $1[1]
            ])), power)
        }
        return total / Float(teacherData.count)
    }
}
