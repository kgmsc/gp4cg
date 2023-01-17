//
//  SaveProgress.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/04.
//

import Foundation

/// This is a GeneticOperation that saves individuals to a file at the end of each generation.
/// The data is saved in a JSON format.
/// The filename is the generation number, and the file is placed in the directory specified by saveDirectory.
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
