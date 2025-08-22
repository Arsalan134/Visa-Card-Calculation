//
//  Extension.swift
//  Visa Card Calculation
//
//  Created by Arsalan Iravani on 8/9/19.
//  Copyright © 2019 Arsalan Iravani. All rights reserved.
//

import Foundation

extension String {
    func formatVisa() -> String {
        var string: String = ""
        for i in 0 ..< self.count {
            if i % 4 == 0 && i != 0 {
                string.append(" ")
            }
            string.append(self[self.index(self.startIndex, offsetBy: i)])
        }
        return string
    }
}

func isCorrect(sequence: [Int]) -> Bool {
    var newSequence = sequence
    for i in stride(from: 0, to: 16, by: 2) {
        newSequence[i] *= 2
        if newSequence[i] > 9 {
            newSequence[i] -= 9
        }
    }

    let sum = newSequence.reduce(0, +)
    return sum % 10 == 0 ? true : false
}

func isCorrect(sequence: [Character]) -> Bool {
    for char in sequence {
        if !char.isNumber {
            return false
        }
    }
    var newSequence: [Int] = sequence.map { (c) -> Int in
        return Int("\(c)")!
    }
    for i in stride(from: 0, to: sequence.count, by: 2) {
        newSequence[i] *= 2
        if newSequence[i] > 9 {
            newSequence[i] -= 9
        }
    }

    let sum = newSequence.reduce(0, +)
    return sum % 10 == 0 ? true : false
}
