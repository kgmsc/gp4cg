//
//  main.swift
//  gp4cg
//
//  Created by KeitoTanemura on 2022/11/09.
//

import Foundation
import TabularData

let teacherData =  grundy8

let config = SymbolicRegressorConfiguration(populationSize: 10000, generations: 20, depthRange: 3..<6)
//let regressor = SymbolicRegressor(configuration: config, resumptionPath: "\(NSHomeDirectory())/Desktop/gp4cg/grundy4/log_2022_12_14_10_31_35/10.log")
let regressor = SymbolicRegressor(configuration: config)

let mae = MeanAbsoluteError2d(teacherData: teacherData)
let acc = Accuracy(teacherData: teacherData)

let candidateManager = CandidateManager(uniquenessIndicator: { $0.evaluation(acc) == $1.evaluation(acc) })

func checkCoverRate(array: [Bool]) -> Double {
    // array の中で true の個数をカウントする
    let trueCount = array.filter { $0 == true }.count
    return Double(trueCount) / Double(array.count) // 平均
}

let formatter = DateFormatter()
formatter.dateFormat = "yyyy_M_d_H_m_s"
let saveDir = "\(NSHomeDirectory())/Desktop/gp4cg/grundy8/log_\(formatter.string(from: Date()))"

regressor.operations = [
    TournamentSelection(sortFunction: { $0.evaluation(mae) < $1.evaluation(mae) }, tournamentSize: 4),
    Fork(operations: [
        RandomMutation(teacherData: teacherData),
        Nothing()
    ]),
    TournamentSelection(sortFunction: { $0.evaluation(acc) == $1.evaluation(acc) ? $0.evaluation(mae) < $1.evaluation(mae) : $0.evaluation(acc) > $1.evaluation(acc) }, tournamentSize: 2),
    Pick(candidateManager: candidateManager, filterFunction: { individual in
        individual.evaluation(acc) > 0.4
    }),
    SaveProgress(saveDirectory: saveDir),
    PrintBest(sortFunction: { $0.evaluation(acc) == $1.evaluation(acc) ? $0.evaluation(mae) < $1.evaluation(mae) : $0.evaluation(acc) > $1.evaluation(acc) }),
    CustomOperation(operation: { population in
        for candidate in candidateManager.candidates {
            print("\t \(candidate)")
        }
        return population
    }, description: "\tCandidates"),
    CustomOperation(operation: { population in
        var isCoveredList = teacherData.map { _ in false }
        var allformulasList = candidateManager.candidates(teacherData: teacherData).map { _ in isCoveredList }
        for (formulaNumber, formula) in candidateManager.candidates(teacherData: teacherData).enumerated() { // 式リストから式を取り出す
            for (i, ele) in formula.evaluation(teacherData).enumerated() { // 取り出された式をevaluateする
                if ele {
                    allformulasList[formulaNumber][i] = true
                }
            }
        }
        // allfomulasListが空の時は動くとバグるのでifで制御
        if (allformulasList.count != 0){
            // 全て当てはまる最小のを探す
            var bestcomboFormula:[Bool] = [false] // 仮。初期化する必要あるため適当にfalseにしておく
            for comboFormula in allformulasList.combinations(ofCount: 1...allformulasList.count){
                var comboScoreFormulaList:[Bool] = [false]; // 仮。初期化する必要あるため適当にfalseにしておく
                if (comboFormula.count > 1){
                    comboScoreFormulaList = comboFormula.reduce([]){result, array in return result + zip(result, array).map{$0 || $1 == true ? true : false}}
                }else{
                    comboScoreFormulaList = comboFormula[0].map { $0 == true ? true : false}
                }
                if (checkCoverRate(array: comboScoreFormulaList) > checkCoverRate(array: bestcomboFormula)){
                    bestcomboFormula = comboScoreFormulaList
                    print("一致率: \(checkCoverRate(array: comboScoreFormulaList))")
                    if (checkCoverRate(array: comboScoreFormulaList) == 1){
                        print("一致しました一致しました一致しました一致しました一致しました一致しました一致しました一致しました一致しました")
                        break
                    }
                }
            }
            // もともと作成されてたものに合わせる
            isCoveredList = bestcomboFormula
        }
        // カバーされてないの抽出
        let result = teacherData.enumerated().filter { !isCoveredList[$0.offset] }.map { $0.element }
        print("RRRRRRRRRESTTTTTT \(result)")
        return population
    }, description: "Candidate Not Covered")
]

regressor.fit()

var df = DataFrame()
df.append(column: Column(name: "x", contents: teacherData.map { $0[0] }))
df.append(column: Column(name: "y", contents: teacherData.map { $0[1] }))
df.append(column: Column(name: "z", contents: teacherData.map { $0[2] }))
for formula in candidateManager.candidates(teacherData: teacherData) {
    df.append(column: Column(name: "\(formula.node) & \(formula.node.toFunctionStyleString())", contents: formula.evaluation(teacherData).map { $0 ? 1 : 0 }))
}
try? df.writeCSV(to: URL(fileURLWithPath: "\(saveDir)/result.csv"), options: .init(delimiter: "\t"))

let cddata =  try! JSONEncoder().encode(candidateManager.candidates)
try! cddata.write(to: URL(fileURLWithPath: "\(saveDir)/candidate.data"))


