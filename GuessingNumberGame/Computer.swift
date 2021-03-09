//
//  Computer.swift
//  GuessingNumberGame
//
//  Created by 廖昱晴 on 2021/3/9.
//

import Foundation

class Computer: Basic {
    
    var answerNumberString = ""
    var guessCount = 0
    
    override init() {
        super.init()
        generateNumberString() //一開始建立好computer類別時，就執行generateNumberString()
    }
    
    //產生答案
    func generateNumberString() {
        var numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        for _ in 1...MAX_NUMBER {
            let index = Int.random(in: 0..<numbers.count)
            let number = numbers[index]
            answerNumberString += number
            if ALLOW_DUPLICATE_NUMBER == false { //移除已加入過的數字
                numbers.remove(at: index)
            }
        }
        print("Answer: \(answerNumberString)")
    }
    
    func userGuess(input: String) -> (A: Int, B: Int)? {
        let result = checkAB(test: input, answer: answerNumberString)
        if result != nil {
            guessCount += 1
        }
        return result
    }
}
