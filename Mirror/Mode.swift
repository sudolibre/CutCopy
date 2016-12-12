//
//  Mode.swift
//  Mirror
//
//  Created by Jonathon Day on 12/7/16.
//  Copyright © 2016 dayj. All rights reserved.
//

import Foundation

enum Mode : CustomStringConvertible {
    case normal, reverse, naked
    
    var description: String {
        switch self {
        case .normal:
            return "normally"
        case .reverse:
            return "in reversed order"
        case .naked:
            return "in a random order"
        }
    }
}
