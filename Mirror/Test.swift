//
//  Test.swift
//  Mirror
//
//  Created by Jonathon Day on 12/7/16.
//  Copyright © 2016 dayj. All rights reserved.
//

import Foundation

func runTests() {
    
}


func test(testName: String, condition: Bool, failtureMessage: String) {
    if condition {
        print("\(testName) passed")
    } else {
        print("\(testName) failed!: \(failtureMessage)")
    }
    
//    func testIntroNormal() {
//        let result = intro(mode: .normal)
//    }
    
    func testResult() {
        let piecesOfText = ["This is the first set of text", "A second string of text lives here", "The final string of text is best text"]
        let result = results(mode: <#T##Mode#>, piecesOfText: <#T##[String]#>)
        let expected =
    }
}
