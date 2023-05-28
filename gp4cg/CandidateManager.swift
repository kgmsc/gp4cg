//
//  CandidateManager.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

/// Find a candidate expression
class CandidateManager {
    /// formula list
    private(set) var candidates: Set<Individual> = []
    var uniquenessIndicator: (Individual, Individual) -> Bool
    
    init(uniquenessIndicator: @escaping (Individual, Individual) -> Bool) {
        self.uniquenessIndicator = uniquenessIndicator
    }
    
    /// Adds a new individual to the population.
    /// Checks for uniqueness using the uniquenessIndicator function.
    /// If the individual is already in the population, it is not added.
    func add(_ individuals: [Individual]) {
        for individual in individuals {
            if !candidates.contains(where: { uniquenessIndicator($0, individual) }) {
                candidates.insert(individual)
            }
        }
    }
    
    func candidates(teacherData: [[Int]]) -> [Individual] {
        let orderedCandidate = Array(candidates)
        let candidateMatches = candidates.map { $0.evaluation(isCorrect: teacherData) }
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
        let url = URL(string: "http://localhost:5102/find_minimum_necessary")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let json: [String: Any] = ["candidates": candidates.map { ["judge_result" : $0.judgeResult, "formulas": $0.node.toFunctionStyleString() ]}]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        request.httpBody = jsonData

        let semaphore = DispatchSemaphore(value: 0)

        var result: [Bool] = []

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("error=\(String(describing: error))")
                return
            }

            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }

            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as? [Bool] {
                    result = jsonResult
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }

            semaphore.signal()
        }

        task.resume()

//        _ = semaphore.wait(timeout: 10)

        return result
    }
}
