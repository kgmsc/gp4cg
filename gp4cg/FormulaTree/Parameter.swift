//
//  Parameter.swift
//  gp4cg
//
//  Created by KeitoTanemura on 2022/11/10.
//

import Foundation

protocol Parameter: Codable {
    func calculate(_ localParameters: [String: Int]) -> Int
}

extension Int: Parameter {
    func calculate(_ localParameters: [String: Int]) -> Int {
        self
    }
}

extension String: Parameter {
    func calculate(_ localParameters: [String: Int]) -> Int {
        localParameters[self]!
    }
}

extension Node: Parameter {
    func calculate(_ localParameters: [String: Int]) -> Int {
        return op.function(params.map{ $0.calculate(localParameters) })
    }
}
