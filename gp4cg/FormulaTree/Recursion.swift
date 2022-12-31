//
//  Recursion.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/18.
//

import Foundation

struct Recursion {
    let changeValue: String
    let delta: Int
}

extension Recursion: CustomStringConvertible {
    var description: String {
        "f(\(self.changeValue) - \(self.delta))"
    }
    
    func toFunctionStyleString() -> String {
        "f(\(self.changeValue) - \(self.delta))"
    }
}
