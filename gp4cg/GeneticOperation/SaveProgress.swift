//
//  SaveProgress.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

struct SaveProgress: GeneticOperation {
    var description: String = "\tSave"
    let saveDirectory: String

    func exec(_ population: [Individual], generation: Int) -> [Individual] {
        guard let data = try? JSONEncoder().encode(population) else {
            return population
        }
        let path = saveDirectory + "/\(generation).log"
        try? FileManager.default.createDirectory(atPath: saveDirectory, withIntermediateDirectories: true)
        FileManager.default.createFile(atPath: path, contents: data)
        return population
    }
}
