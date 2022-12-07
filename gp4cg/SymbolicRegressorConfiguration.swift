//
//  SymbolicRegressorConfiguration.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/02.
//

import Foundation

struct SymbolicRegressorConfiguration {
    let populationSize: Int
    let generations: Int
    
    let depthRange: Range<Int>
}
