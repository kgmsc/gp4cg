//
//  Node+Collection.swift
//  gp4cg
//
//  Created by Yuji Sasaki on 2022/12/08.
//

import Foundation

extension Node: Collection {
    var startIndex: Int {
        0
    }
    var endIndex: Int {
        nodeCount
    }
    
    subscript(position: Int) -> Element {
        get {
            precondition(0 < position && position <= endIndex)
            var tmpPosition = position
            for param in params {
                switch tmpPosition {
                case 1..<param.nodeCount:
                    guard let param = param as? Node else {
                        fatalError()
                    }
                    return param[tmpPosition]
                case param.nodeCount:
                    return param
                default:
                    tmpPosition -= param.nodeCount
                    continue
                }
            }
            fatalError("Index out of range")
        }
        set (node) {
            precondition(0 < position && position <= endIndex)
            var tmpPosition = position
            for (i, param) in params.enumerated() {
                switch tmpPosition {
                case 1..<param.nodeCount:
                    guard var param = param as? Node else {
                        fatalError()
                    }
                    let oldWeight = param.nodeCount
                    param[tmpPosition] = node
                    params[i] = param
                    nodeCount = nodeCount - oldWeight + node.nodeCount
                    return
                case param.nodeCount:
                    let oldWeight = params[i].nodeCount
                    params[i] = node
                    nodeCount = nodeCount - oldWeight  + params[i].nodeCount
                    return
                default:
                    tmpPosition -= param.nodeCount
                    continue
                }
            }
            fatalError("Index out of range")
        }
    }
    
    func index(after i: Int) -> Int {
        i + 1
    }
}
