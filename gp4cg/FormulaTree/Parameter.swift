//
//  Parameter.swift
//  gp4cg
//
//  Created by KeitoTanemura on 2022/11/10.
//

import Foundation

protocol Parameter {
    func calculate(_ localParameters: [String: Int], previousResults: [Int: Int]) -> Int
    var nodeCount: Int { get }
    var staticValue: Int? { get }
    func toFunctionStyleString() -> String
}

extension Int: Parameter {
    func calculate(_ localParameters: [String: Int], previousResults: [Int: Int]) -> Int {
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
    func calculate(_ localParameters: [String: Int], previousResults: [Int: Int]) -> Int {
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
    func calculate(_ localParameters: [String: Int], previousResults: [Int: Int]) -> Int {
        return staticValue ?? op.function(params.map{ $0.calculate(localParameters, previousResults: previousResults) })
    }
}

extension Recursion: Parameter {
    func calculate(_ localParameters: [String: Int], previousResults: [Int: Int]) -> Int {
        var param = localParameters
        guard let oldParam = param[self.changeValue] else {
            fatalError()
        }
        param[self.changeValue] = oldParam - self.delta
//        print("親から引き継ぎ", localParameters)
//        print("作成",param)
//        print("出力予定", previousResults[param.hashValue] ?? 0)
        return previousResults.keys.contains(param.hashValue) ? previousResults[param.hashValue]! : 0
    }
    var nodeCount: Int {
        1
    }
    var staticValue: Int? {
        nil
    }
}
