//
//  Fitness.swift
//  gp4cg
//
//  Created by KeitoTanemura on 2022/11/10.
//

import Foundation

protocol Fitness {
    var teacherData: [[Int]] { get }
    func exec(_ individual: Individual) -> Float
}
