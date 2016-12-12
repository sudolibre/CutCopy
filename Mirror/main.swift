//
//  main.swift
//  Mirror
//
//  Created by Jonathon Day on 12/7/16.
//  Copyright © 2016 dayj. All rights reserved.
//

import Foundation


func askQuestion(_ question: String) -> String {
    print(question)
    let answer = readLine(strippingNewline: true)!
    return answer
}

func intro(mode: Mode) -> [String] {
    var piecesOfText = [String]()
    let answer = askQuestion("Hello and welcome to the Mirror app! Please provide pieces of text and I will print them back to you \(mode). How many pieces of text would you like to provide?")
    let numberOfText = Int(answer)!
    let formatter = NumberFormatter()
    formatter.numberStyle = .ordinal
    for i in 1...numberOfText {
        let numberOfTextDescription = formatter.string(from: NSNumber(integerLiteral: i))!
        let answer = askQuestion("Please provide the \(numberOfTextDescription) piece of text.")
        piecesOfText.append(answer)
        }
    return piecesOfText
}

func results(mode: Mode, piecesOfText: [String]) {
    print("******** Results Below ********")
    switch mode {
    case .normal:
        print(piecesOfText.joined(separator: "\n"))
    case .reverse:
        let reversed = piecesOfText.reversed() as [String]
        print(reversed.joined(separator: "\n"))
    case .naked:
        var shuffled = [String]()
        var n = 0
        for i in piecesOfText {
            n += 1
            let random = Int(arc4random_uniform(UInt32(n)))
            shuffled.insert(i, at: random)
        }
        print(shuffled.joined(separator: "\n"))
    }
}

func play(_ arguments: [String]) {
    var piecesOfText = [String]()
    var mode: Mode = .normal
    switch arguements {
    case let x where x.isEmpty:
        mode = .normal
        piecesOfText = intro(mode: mode)
    case let x where x[x.startIndex] == "--run-tests":
        mode = .normal
        runTests()
    case let x where x[x.startIndex] == "--reverse":
        mode = .reverse
        piecesOfText = intro(mode: mode)
    case let x where x[x.startIndex] == "--naked-lunch":
        mode = .naked
        piecesOfText = intro(mode: mode)
    default:
        mode = .normal
        piecesOfText = intro(mode: mode)
    }
    results(mode: mode, piecesOfText: piecesOfText)
}

let arguements = Array(CommandLine.arguments.dropFirst())

play(arguements)
