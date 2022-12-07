//
//  MeanAbsoluteError2d.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

struct MeanAbsoluteError2d: Fitness {
    let teacherData: [[Int]]
    
    func exec(_ individual: Individual) -> Float {
        let total = teacherData.reduce(Float.zero) {
            $0 + Float(Swift.abs($1[2] - individual.calculate([
                "X0": $1[0],
                "X1": $1[1]
            ])))
        }
        return total / Float(teacherData.count)
    }
}
