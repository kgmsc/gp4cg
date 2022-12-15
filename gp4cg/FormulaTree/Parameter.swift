//
//  Parameter.swift
//  gp4cg
//
//  Created by KeitoTanemura on 2022/11/10.
//

import Foundation

protocol Parameter {
    func calculate(_ localParameters: [String: Int]) -> Int
    var nodeCount: Int { get }
    var staticValue: Int? { get }
    func toFunctionStyleString() -> String
}

extension Int: Parameter {
    func calculate(_ localParameters: [String: Int]) -> Int {
        self
    }
    var nodeCount: Int {
        1
    }
    var staticValue: Int? {
        self
    }
    func toFunctionStyleString() -> String {
        "\(self)"
    }
}

extension String: Parameter {
    func calculate(_ localParameters: [String: Int]) -> Int {
        localParameters[self]!
    }
    var nodeCount: Int {
        1
    }
    var staticValue: Int? {
        nil
    }
    func toFunctionStyleString() -> String {
        self
    }
}

extension Node: Parameter {
    func calculate(_ localParameters: [String: Int]) -> Int {
        return staticValue ?? op.function(params.map{ $0.calculate(localParameters) })
    }
}
