//
//  MeanAbsoluteError2d.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

struct MeanAbsoluteError2d: Fitness {
    let teacherData: [[Int]]
    
    func exec(_ values: [Int]) -> Float {
        let total = teacherData.enumerated().reduce(Int.zero) {
            $0 + $1.element[2] &- values[$1.offset]
        }
        return Float(total) / Float(teacherData.count)
    }
}
