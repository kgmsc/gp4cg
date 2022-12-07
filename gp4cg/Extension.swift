//
//  Extension.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/11/30.
//

import Foundation

extension Array {
    func chunked(by size: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, self.count)])
        }
    }
}
