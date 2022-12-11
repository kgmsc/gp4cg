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
        
        var depth = 0
        var targetNode: Parameter = node
        while let target = targetNode as? Node {
            depth = target.depth
            targetNode = target.params.first!
        }
        XCTAssert(depth <= maxDepth, "Depth is over max depth.")
    }
    
    func testMaxDepthIs2() throws {
        let maxDepth = 2
        var node = Node(op: Operator.random(), maxDepth: maxDepth)
        node.setRandomParams(isPriority: true)
        
        var depth = 0
        var targetNode: Parameter = node
        while let target = targetNode as? Node {
            depth = target.depth
            targetNode = target.params.first!
        }
        XCTAssert(depth <= maxDepth, "Depth is over max depth.")
    }
    
    func testAccessDepth1() throws {
        var no0 = Node(op: Operator.operators["xor"]!, maxDepth: 3)
        var no00 = Node(op: Operator.operators["sub"]!, maxDepth: 3)
        var no01 = Node(op: Operator.operators["add"]!, maxDepth: 3)
        let no000 = 3
        let no001 = "X1"
        let no010 = "X2"
        let no011 = 1
        no0.nodeCount = 7
        no0.depth = 0
        no01.params = [no010, no011]
        no01.nodeCount = 3
        no01.depth = 1
        no00.params = [no000, no001]
        no00.nodeCount = 3
        no00.depth = 1
        no0.params = [no00, no01]
        
        XCTAssert(String(describing: no0[1]) == String(describing: no000), "Accessor cannot access 1.")
    }
    
    func testAccess1() throws {
        var no0 = Node(op: Operator.operators["xor"]!, maxDepth: 3)
        var no00 = Node(op: Operator.operators["sub"]!, maxDepth: 3)
        var no01 = Node(op: Operator.operators["add"]!, maxDepth: 3)
        let no000 = 3
        let no001 = "X1"
        let no010 = "X2"
        let no011 = 1
        no0.nodeCount = 7
        no0.depth = 0
        no01.params = [no010, no011]
        no01.nodeCount = 3
        no01.depth = 1
        no00.params = [no000, no001]
        no00.nodeCount = 3
        no00.depth = 1
        no0.params = [no00, no01]
        
        XCTAssert(String(describing: no0[1]) == String(describing: no000), "Accessor cannot access 3.")
    }
    
    func testAccess3() throws {
        var no0 = Node(op: Operator.operators["xor"]!, maxDepth: 3)
        var no00 = Node(op: Operator.operators["sub"]!, maxDepth: 3)
        var no01 = Node(op: Operator.operators["add"]!, maxDepth: 3)
        let no000 = 3
        let no001 = "X1"
        let no010 = "X2"
        let no011 = 1
        no0.nodeCount = 7
        no0.depth = 0
        no01.params = [no010, no011]
        no01.nodeCount = 3
        no01.depth = 1
        no00.params = [no000, no001]
        no00.nodeCount = 3
        no00.depth = 1
        no0.params = [no00, no01]
        
        XCTAssert(String(describing: no0[3]) == String(describing: no00), "Accessor cannot access 3.")
    }
    
    func testAccessSet3() throws {
        var no0 = Node(op: Operator.operators["xor"]!, maxDepth: 3)
        var no00 = Node(op: Operator.operators["sub"]!, maxDepth: 3)
        var no01 = Node(op: Operator.operators["add"]!, maxDepth: 3)
        let no000 = 3
        let no001 = "X1"
        let no010 = "X2"
        let no011 = 1
        no0.nodeCount = 7
        no0.depth = 0
        no01.params = [no010, no011]
        no01.nodeCount = 3
        no01.depth = 1
        no00.params = [no000, no001]
        no00.nodeCount = 3
        no00.depth = 1
        no0.params = [no00, no01]
        
        var new =  Node(op: Operator.operators["div"]!, maxDepth: 3)
        new.params = [5, "X1"]
        new.depth = 1
        new.nodeCount = 3
        
        no0[3] = new
        XCTAssert(String(describing: no0[3]) == String(describing: new), "Accessor cannot set 3.")
    }

}
