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
            precondition(0 <= position && position < endIndex)
            var tmpPosition = position
            for param in params {
                switch tmpPosition {
                case 0..<param.nodeCount:
                    if let param = param as? Node {
                        return param[tmpPosition]
                    } else {
                        return param
                    }
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
            precondition(0 <= position && position < endIndex)
            var tmpPosition = position
            for (i, param) in params.enumerated() {
                switch tmpPosition {
                case 0..<param.nodeCount:
                    let oldWeight = params[i].nodeCount
                    if var param = param as? Node {
                        param[tmpPosition] = node
                        params[i] = param
                    } else {
                        params[i] = node
                    }
                    nodeCount = nodeCount - oldWeight + params[i].nodeCount
                    return
                case param.nodeCount:
                    let oldWeight = param.nodeCount
                    params[i] = node
                    nodeCount = nodeCount - oldWeight  + node.nodeCount
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
