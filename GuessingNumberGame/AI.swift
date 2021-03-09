//
//  AI.swift
//  GuessingNumberGame
//
//  Created by 廖昱晴 on 2021/3/9.
//

import Foundation

class AI: Basic {
    
    var allPossibilities = [String]()
    var lastGuess: String? = nil
    var aiGuessCount = 0
    
    override init() {
        super.init()
        getAllPossibilities()
    }
    
    func getAllPossibilities() { //4位數，不重複 -> startNumber:1234, endNumber:9876
        var startNumber = 0
        var endNumber = 0
        
        if ALLOW_DUPLICATE_NUMBER == false {
            startNumber = 0
            for i in 0..<MAX_NUMBER {
                startNumber *= 10
                startNumber += i
                endNumber *= 10
                endNumber += 9 - i
            }
        }
        let formateString = String(format: "%%0%dd", MAX_NUMBER)
        for i in startNumber...endNumber {
            let tempNumber = String(format: formateString, i)
            if isOkNumber(input: tempNumber) {
                allPossibilities.append(tempNumber)
            }
        }
        
        print("Total: \(allPossibilities.count) numbers.")
    }
    
    func aiAnswer() -> String? {
        if allPossibilities.count == 0 {
            return nil
        }
        let index = Int.random(in: 0..<allPossibilities.count)
        let answer = allPossibilities[index]
        lastGuess = answer
        aiGuessCount += 1
        
        return answer
    }
    
    func userReply(replyA: Int, replyB: Int) -> Bool? {
        if allPossibilities.count == 0 || lastGuess == nil {
            return nil
        }
        if replyA == MAX_NUMBER {
            return true
        }
        var newPossibilities = [String]()
        for number in allPossibilities {
            let tempAB = checkAB(test: number, answer: lastGuess!)
            if tempAB == nil {
                return nil
            }
            if tempAB!.A == replyA && tempAB!.B == replyB {
                newPossibilities.append(number)
            }
        }
        allPossibilities = newPossibilities
        print("Total: \(allPossibilities.count) numbers.")
        
        return false
    }
    
}
