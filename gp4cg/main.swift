//
//  main.swift
//  gp4cg
//
//  Created by KeitoTanemura on 2022/11/09.
//

import Foundation
import TabularData

let teacherData =  [[0, 0, 3], [0, 1, 2], [1, 0, 4], [1, 1, 5], [1, 2, 6], [1, 3, 7], [2,
                                                                                       0, 7], [2, 1, 6], [2, 2, 5], [3, 0, 0], [4, 0, 1], [5, 0, 8], [5,
                                                                                      1, 9], [5, 2, 10], [5, 3, 11], [5, 4, 12], [5, 5, 13], [5, 6,
                                                                                      14], [5, 7, 15], [6, 0, 9], [6, 1, 8], [6, 2, 11], [6, 3, 10], [6,
                                                                                      4, 13], [6, 5, 12], [6, 6, 15], [6, 7, 14], [7, 0, 2], [7, 1,
                                                                                      3], [8, 0, 5], [8, 1, 4], [8, 2, 7], [8, 3, 6], [9, 0, 6], [9, 1,
                                                                                      7], [9, 2, 4], [10, 0, 13], [10, 1, 12], [10, 2, 15], [10, 3,
                                                                                      14], [10, 4, 9], [11, 0, 14], [11, 1, 15], [11, 2, 12], [11, 3,
                                                                                      13], [11, 4, 10], [11, 5, 11], [12, 0, 15], [12, 1, 14], [12, 2,
                                                                                      13], [12, 3, 12], [12, 4, 11], [12, 5, 10], [13, 0, 10], [13, 1,
                                                                                      11], [13, 2, 8], [13, 3, 9], [13, 4, 14], [13, 5, 15], [13, 6,
                                                                                      12], [14, 0, 11], [14, 1, 10], [14, 2, 9], [14, 3, 8], [14, 4,
                                                                                      15], [14, 5, 14], [14, 6, 13], [15, 0, 12], [15, 1, 13], [15, 2,
                                                                                      14], [15, 3, 15], [15, 4, 8], [16, 0, 17], [16, 1, 16], [16, 2,
                                                                                      19], [16, 3, 18], [16, 4, 21], [16, 5, 20], [16, 6, 23], [16, 7,
                                                                                      22], [16, 8, 25], [16, 9, 24], [16, 10, 27], [16, 11, 26], [16, 12,
                                                                                      29], [16, 13, 28], [16, 14, 31], [16, 15, 30], [17, 0, 16], [17, 1,
                                                                                      17], [17, 2, 18], [17, 3, 19], [17, 4, 20], [17, 5, 21], [17, 6,
                                                                                      22], [17, 7, 23], [17, 8, 24], [17, 9, 25], [17, 10, 26], [17, 11,
                                                                                      27], [17, 12, 28], [17, 13, 29], [17, 14, 30], [17, 15, 31], [18, 0,
                                                                                       21], [18, 1, 20], [18, 2, 23], [18, 3, 22], [18, 4, 17], [18, 5,
                                                                                      16], [18, 6, 19], [18, 7, 18], [18, 8, 29], [18, 9, 28], [18, 10,
                                                                                      31], [18, 11, 30], [18, 12, 25], [19, 0, 22], [19, 1, 23], [19, 2,
                                                                                      20], [19, 3, 21], [19, 4, 18], [19, 5, 19], [19, 6, 16], [19, 7,
                                                                                      17], [19, 8, 30], [19, 9, 31], [19, 10, 28], [19, 11, 29], [19, 12,
                                                                                      26], [19, 13, 27], [20, 0, 23], [20, 1, 22], [20, 2, 21], [20, 3,
                                                                                      20], [20, 4, 19], [20, 5, 18], [20, 6, 17], [20, 7, 16], [20, 8,
                                                                                      31], [20, 9, 30], [20, 10, 29], [20, 11, 28], [20, 12, 27], [20, 13,
                                                                                       26], [21, 0, 18], [21, 1, 19], [21, 2, 16], [21, 3, 17], [21, 4,
                                                                                      22], [21, 5, 23], [21, 6, 20], [21, 7, 21], [21, 8, 26], [21, 9,
                                                                                      27], [21, 10, 24], [21, 11, 25], [21, 12, 30], [21, 13, 31], [21,
                                                                                      14, 28], [22, 0, 19], [22, 1, 18], [22, 2, 17], [22, 3, 16], [22, 4,
                                                                                       23], [22, 5, 22], [22, 6, 21], [22, 7, 20], [22, 8, 27], [22, 9,
                                                                                      26], [22, 10, 25], [22, 11, 24], [22, 12, 31], [22, 13, 30], [22,
                                                                                      14, 29], [23, 0, 20], [23, 1, 21], [23, 2, 22], [23, 3, 23], [23, 4,
                                                                                       16], [23, 5, 17], [23, 6, 18], [23, 7, 19], [23, 8, 28], [23, 9,
                                                                                      29], [23, 10, 30], [23, 11, 31], [23, 12, 24], [24, 0, 25], [24, 1,
                                                                                      24], [24, 2, 27], [24, 3, 26], [24, 4, 29], [24, 5, 28], [24, 6,
                                                                                      31], [24, 7, 30], [24, 8, 17], [25, 0, 24], [25, 1, 25], [25, 2,
                                                                                      26], [25, 3, 27], [25, 4, 28], [25, 5, 29], [25, 6, 30], [25, 7,
                                                                                      31], [25, 8, 16], [26, 0, 29], [26, 1, 28], [26, 2, 31], [26, 3,
                                                                                      30], [26, 4, 25], [26, 5, 24], [26, 6, 27], [26, 7, 26], [26, 8,
                                                                                      21], [26, 9, 20], [26, 10, 23], [26, 11, 22], [27, 0, 30], [27, 1,
                                                                                      31], [27, 2, 28], [27, 3, 29], [27, 4, 26], [27, 5, 27], [27, 6,
                                                                                      24], [27, 7, 25], [27, 8, 22], [27, 9, 23], [27, 10, 20], [28, 0,
                                                                                      31], [28, 1, 30], [28, 2, 29], [28, 3, 28], [28, 4, 27], [28, 5,
                                                                                      26], [28, 6, 25], [28, 7, 24], [28, 8, 23], [28, 9, 22], [28, 10,
                                                                                      21], [29, 0, 26], [29, 1, 27], [29, 2, 24], [29, 3, 25], [29, 4,
                                                                                      30], [29, 5, 31], [29, 6, 28], [29, 7, 29], [29, 8, 18], [29, 9,
                                                                                      19], [30, 0, 27], [30, 1, 26], [30, 2, 25], [30, 3, 24], [30, 4,
                                                                                      31], [30, 5, 30], [30, 6, 29], [30, 7, 28], [30, 8, 19], [30, 9,
                                                                                      18], [31, 0, 28], [31, 1, 29], [31, 2, 30], [31, 3, 31], [31, 4,
                                                                                      24], [31, 5, 25], [31, 6, 26], [31, 7, 27], [31, 8, 20], [31, 9,
                                                                                      21], [31, 10, 22], [31, 11, 23], [32, 0, 33], [32, 1, 32], [32, 2,
                                                                                      35], [32, 3, 34], [32, 4, 37], [32, 5, 36], [32, 6, 39], [32, 7,
                                                                                      38], [32, 9, 40], [33, 0, 32], [33, 1, 33], [33, 2, 34], [33, 3,
                                                                                      35], [33, 4, 36], [33, 5, 37], [33, 6, 38], [33, 7, 39], [33, 8,
                                                                                      40], [34, 0, 37], [34, 1, 36], [34, 2, 39], [34, 3, 38], [34, 4,
                                                                                      33], [34, 5, 32], [34, 6, 35], [34, 7, 34], [34, 13, 40], [35, 0,
                                                                                      38], [35, 1, 39], [35, 2, 36], [35, 3, 37], [35, 4, 34], [35, 5,
                                                                                      35], [35, 6, 32], [35, 7, 33], [35, 14, 40], [36, 0, 39], [36, 1,
                                                                                      38], [36, 2, 37], [36, 3, 36], [36, 4, 35], [36, 5, 34], [36, 6,
                                                                                      33], [36, 7, 32], [36, 15, 40], [37, 0, 34], [37, 1, 35], [37, 2,
                                                                                      32], [37, 3, 33], [37, 4, 38], [37, 5, 39], [37, 6, 36], [37, 7,
                                                                                      37], [37, 10, 40], [38, 0, 35], [38, 1, 34], [38, 2, 33], [38, 3,
                                                                                      32], [38, 4, 39], [38, 5, 38], [38, 6, 37], [38, 7, 36], [38, 11,
                                                                                      40], [39, 0, 36], [39, 1, 37], [39, 2, 38], [39, 3, 39], [39, 4,
                                                                                      32], [39, 5, 33], [39, 6, 34], [39, 7, 35], [39, 12, 40], [40, 1,
                                                                                      40], [40, 8, 33], [40, 9, 32], [40, 10, 35], [40, 11, 34], [40, 12,
                                                                                      37], [40, 13, 36], [40, 14, 39], [40, 15, 38]]

let config = SymbolicRegressorConfiguration(populationSize: 10000, generations: 20, depthRange: 3..<6)
//let regressor = SymbolicRegressor(configuration: config, resumptionPath: "\(NSHomeDirectory())/Desktop/gp4cg/log_2022_12_4_22_11_5/20.log")
let regressor = SymbolicRegressor(configuration: config)

let mae = MeanAbsoluteError2d(teacherData: teacherData)
let acc = Accuracy(teacherData: teacherData)

let candidateManager = CandidateManager(uniquenessIndicator: { $0.evaluation(acc) == $1.evaluation(acc) })


let formatter = DateFormatter()
formatter.dateFormat = "yyyy_M_d_H_m_s"
let saveDir = "\(NSHomeDirectory())/Desktop/gp4cg/testgrundy4/log_\(formatter.string(from: Date()))"

regressor.operations = [
    TournamentSelection(sortFunction: { $0.evaluation(mae) < $1.evaluation(mae) }, tournamentSize: 4),
    Fork(operations: [
        RandomMutation(teacherData: teacherData),
        Nothing()
    ]),
    TournamentSelection(sortFunction: { $0.evaluation(acc) == $1.evaluation(acc) ? $0.evaluation(mae) < $1.evaluation(mae) : $0.evaluation(acc) > $1.evaluation(acc) }, tournamentSize: 2),
    Pick(candidateManager: candidateManager, filterFunction: { individual in
        individual.evaluation(acc) > 0.3
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
        for formula in candidateManager.candidates(teacherData: teacherData) {
            for (i, ele) in formula.evaluation(teacherData).enumerated() {
                if ele {
                    isCoveredList[i] = true
                }
            }
        }
        let result = teacherData.enumerated().filter { !isCoveredList[$0.offset] }.map { $0.element }
        print(result)
        return population
    }, description: "Candidate Not Covered")
]

regressor.fit()

var df = DataFrame()
df.append(column: Column(name: "x", contents: teacherData.map { $0[0] }))
df.append(column: Column(name: "y", contents: teacherData.map { $0[1] }))
df.append(column: Column(name: "z", contents: teacherData.map { $0[2] }))
for formula in candidateManager.candidates(teacherData: teacherData) {
    df.append(column: Column(name: String(describing: formula), contents: formula.evaluation(teacherData).map { $0 ? 1 : 0 }))
}
try? df.writeCSV(to: URL(fileURLWithPath: "\(saveDir)/result.csv"))
