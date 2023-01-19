//
//  SymbolicRegressorConfiguration.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/02.
//

import Foundation
/// The population parameters of the genetic programming include the number of expressions to be generated at the start of the algorithm,
///  the number of generations or evolutions, and the complexity or depth of the expressions.
///  These parameters can be adjusted to affect the performance and accuracy of the algorithm.
struct SymbolicRegressorConfiguration {
    /// generated in the initial stage of the genetic programming
    let populationSize: Int
    ///  the number of generations or evolutions
    let generations: Int
    /// the depth of the  expressions
    let depthRange: Range<Int>
}
