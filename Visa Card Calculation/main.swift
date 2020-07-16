//
//  main.swift
//  Visa Card Calculation
//
//  Created by Arsalan Iravani on 11.08.2017.
//  Copyright © 2017 Arsalan Iravani. All rights reserved.
//

import Foundation


func eleminateSpaces(number: String) -> String {
    var number = number
    for char in number {
        if char == " " {
            number.remove(at: number.index(of: char)!)
        }
    }
    return number
}

func check(number: String) -> Bool {
    let string = eleminateSpaces(number: number)
    var numbers: [Int] = []
    var result = 0
    
    for e in string {
        numbers.append(Int(String(e)) ?? 0)
    }
    
    var i = 0
    
    // every 1st x2
    for _ in numbers {
        if i % 2 == 0 {
            numbers[i] = numbers[i] * 2
            if numbers[i] > 9 {
                var num = numbers[i];
                numbers[i] = 0;
                while (num > 0) {
                    numbers[i] = numbers[i] + num % 10;
                    num = num / 10;
                }
            }
        }
        result += numbers[i]
        i += 1
    }
    
    
    return result % 10 == 0
}

//print(code)
//print(check(number: code))


let array = ["a", "b", "c", "d"]
let numbers = [0,1,2,3,4,5,6,7,8,9]

var newArray: [String] = []

/// Creates all possible combinations
func bruteforce(prefix: String = "", startIndex: Int = 0) {
    for i in startIndex ..< array.count {
        let newString = prefix + array[i]
        newArray.append(newString)
        print(newString)
        bruteforce(prefix: newString, startIndex: i + 1)
    }
}


func permutate<T>(array: [T], prefix: String = "", lengthOfArray: Int, k: Int) {
    if (k == 0) {
//        print(prefix)
        newArray.append(prefix)
        return
    }
    for i in 0 ..< lengthOfArray {
        permutate(array: array, prefix: "\(prefix)\(array[i])", lengthOfArray: lengthOfArray, k: k - 1)
    }
}

//42038221269535?9
let sequence = Array("4203822125?14085")
//print(stringArray)
//print(isCorrect(sequence: stringArray))
print(String(sequence).formatVisa())

var counter = 0
func printCompletedCardNumbers(sequence: [Character]) {

    print("Found:")

    var sum = 0
    var numberOfAbsentNumbers = 0

    // Calculate sum and number of absent numbers
    for i in 0 ..< sequence.count {
        if var number: Int = Int("\(sequence[i])") {
            if i % 2 == 0 {
                if number * 2 > 9 {
                    number = number * 2 - 9
                } else {
                    number *= 2
                }
            }
            sum += number
        } else {
            numberOfAbsentNumbers += 1
        }
    }

    newArray = []
    permutate(array: numbers, lengthOfArray: numbers.count, k: numberOfAbsentNumbers)

    for possibleCombination in 0 ..< newArray.count {
        var tempSequence = sequence
        for characterIndex in 0 ..< tempSequence.count {
            if tempSequence[characterIndex] == "?" {
                tempSequence[characterIndex] = newArray[possibleCombination].removeFirst()
            }
        }

        if isCorrect(sequence: tempSequence) {
            print(String(tempSequence).formatVisa())
            counter += 1
        }
    }
}

printCompletedCardNumbers(sequence: sequence)
print("Number of combinations:\t", counter)
