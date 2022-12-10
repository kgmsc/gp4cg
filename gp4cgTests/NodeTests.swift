//
//  gp4cgTests.swift
//  gp4cgTests
//
//  Created by Yuji Sasaki on 2022/12/09.
//

import XCTest
@testable import gp4cg

final class NodeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMaxDepthIs1() throws {
        let maxDepth = 1
        var node = Node(op: Operator.random(), maxDepth: maxDepth)
        node.setRandomParams(isPriority: true)
        
        var depthCount = 0
        var targetNode: Parameter = node
        while let target = targetNode as? Node {
            depthCount += 1
            targetNode = targetNode.
        }
    }

}
