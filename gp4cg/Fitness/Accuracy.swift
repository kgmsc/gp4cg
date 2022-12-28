//
//  Accuracy.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

struct Accuracy: Fitness {
    let teacherData: [[Int]]
    
    func exec(_ values: [Int]) -> Float {
        Float(teacherData.enumerated().filter {
            $0.element[2] == values[$0.offset]
        }.count) / Float(teacherData.count)
    }
}
