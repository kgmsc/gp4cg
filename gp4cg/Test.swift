////
////  Test.swift
////  gp4cg
////
////  Created by Yuji Sasaki on 2022/12/15.
////
//
//import Foundation
//
//let teacherData =  grundy8
//
//let file = URL(fileURLWithPath: "\(NSHomeDirectory())/Desktop/gp4cg/grundy8/log_2022_12_15_12_3_54/candidate.data")
//let d = try! Data(contentsOf: file)
//let decoded = try! JSONDecoder().decode([Individual].self, from: d)
//
//print(decoded[20])
//print(decoded[20].evaluation(teacherData))
//
////for tea in teacherData {
////    let result = decoded[20].node.calculate(["X0": tea[0], "X1": tea[1]])
////    print("\(tea[0]) ^^^^^ \(result) == \(tea[2])")
////}
//
//let result = decoded[20].node.calculate(["X0": 12, "X1": 5])
//print(result)
//
//func test(n: Parameter) {
//    if let node = n as? Node {
//        print("\(node) ")
//        print("\(node) \(node.staticValue) \(node.calculate(["X0": 12, "X1": 5]))")
//        node.params.map{ test(n: $0) }
//    } else {
//        print(n)
//    }
//}
//
//test(n: decoded[20].node)
//
//print("ccc")
//print(12^5)
//print((12^5)^1)
//
//print(decoded[20].node.toFunctionStyleString())
