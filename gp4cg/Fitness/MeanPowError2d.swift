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
    
    func exec(_ values: [Int]) -> Float {
        let total = teacherData.enumerated().reduce(Float.zero) {
            return $0 + pow(Float($1.element[2] - values[$1.offset]), power)
        }
        return total / Float(teacherData.count)
    }
}
