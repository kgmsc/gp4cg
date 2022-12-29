//
//  CandidateManager.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

class CandidateManager {
    private(set) var candidates: Set<Individual> = []
    var uniquenessIndicator: (Individual, Individual) -> Bool
    
    init(uniquenessIndicator: @escaping (Individual, Individual) -> Bool) {
        self.uniquenessIndicator = uniquenessIndicator
    }
    
    func add(_ individuals: [Individual]) {
        for individual in individuals {
            if !candidates.contains(where: { uniquenessIndicator($0, individual) }) {
                candidates.insert(individual)
            }
        }
    }
    
    func candidates(teacherData: [[Int]]) -> [Individual] {
        let orderedCandidate = Array(candidates)
        let candidateMatches = candidates.map { $0.evaluation(teacherData) }
        var list: [Individual] = []
        var listMatches: [[Bool]] = []
        for (i, elem) in candidateMatches.enumerated() {
            if !listMatches.contains(where: { $0.contains(elem) }) {
                listMatches.append(elem)
                list.append(orderedCandidate[i])
            }
        }
        return list
    }
    func conbineLists(array: [[Bool]]) -> [Bool]{
        var result:Array<Bool> = [];
        for i in 0..<array[0].count {
            result.append(array.map {$0[i]}.contains(true))
        }
        return result
    }


    func findMinimamNecessary() -> [Bool] {
        // 全て当てはまる最小のを探す
        var bestFormulaGroup: FormulaGrop = FormulaGrop(formulaList: []);
        if (candidates.count != 0){
            for comboFormulaGroup in candidates.combinations(ofCount: 1...candidates.count){
//                print("最適な組み合わせを一つずつ調べています。現在調べている組み合わせは \(comboFormulaGroup.map { $0.node.toFunctionStyleString() })")
                let comboFormulaJudgeResult: [[Bool]] = comboFormulaGroup.map { $0.judgeResult! };
                let nomalFormulaGroup: FormulaGrop = FormulaGrop(formulaList: comboFormulaGroup);
                if (comboFormulaJudgeResult.count > 1){
                    nomalFormulaGroup.evaluateAccuracy(judgeResult: conbineLists(array: comboFormulaJudgeResult)) // 2つのカバーリストをまとめる
                }else{
                    nomalFormulaGroup.evaluateAccuracy(judgeResult: comboFormulaJudgeResult[0].map { $0 == true ? true : false}) // 1つの組み合わせの場合
                }
//                print("こちらの組み合わせのカバー率は\(nomalFormulaGroup.accuracy)でした！")
                if (bestFormulaGroup.isEmpty() || nomalFormulaGroup.accuracy > bestFormulaGroup.accuracy){
                    bestFormulaGroup = nomalFormulaGroup;
                    if (bestFormulaGroup.accuracy == 1){
                        print("最適な組み合わせが見つかりました。") // Todo: 見つかると実行をやめるようにする
                        break
                    }
                }
            }
            print("現時点での最適な組み合わせは\(bestFormulaGroup.formulaList.map {$0.node.toFunctionStyleString()}) で一致率は \(bestFormulaGroup.accuracy)")
        }
        return bestFormulaGroup.judgeResult
    }
}
