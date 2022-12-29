//
//  Individual.swift
//  gp4cg
//
//  Created by KeitoTanemura on 2022/11/10.
//

import Foundation

class FormulaGrop: Codable{
    var formulaList: [Individual]
    var judgeResult: [Bool]
    var accuracy: Double

    init (formulaList: [Individual]) {
        self.formulaList = formulaList
        self.judgeResult = teacherData.map { _ in false }
        self.accuracy = 0
    }

    func overwriteFormula(inputFormulaList: [Individual]) {
        formulaList = inputFormulaList
    }

    func evaluateAccuracy(judgeResult: [Bool]){
        self.judgeResult = judgeResult // addの要素もあるのでfuncの名前おかしいかも
        self.accuracy = checkCoverRate(array: judgeResult);
    }

    func isEmpty() -> Bool {
        return formulaList.isEmpty
    }
}
