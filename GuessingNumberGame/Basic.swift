//
//  Basic.swift
//  GuessingNumberGame
//
//  Created by 廖昱晴 on 2021/3/9.
//

import Foundation

class Basic {
    let MAX_NUMBER = 4
    let ALLOW_DUPLICATE_NUMBER = false
    
    func isOkNumber(input: String) -> Bool {
        if input.count != MAX_NUMBER { //檢查字串長度
            return false
        }
        if Int(input) == nil { //檢查是否為數字字串
            return false
        }
        if ALLOW_DUPLICATE_NUMBER == false { //檢查數字有無重複
            let inputArray = Array(input)
            let inputSet = Set(inputArray) //Set會去除重複數字
            if inputArray.count != inputSet.count {
                return false
            }
        }
        return true
    }
    
    func checkAB(test: String, answer: String) -> (A: Int, B: Int)? {
        if isOkNumber(input: test) == false || isOkNumber(input: answer) == false {
            return nil
        }
        var resultA = 0
        var resultB = 0
        let testArray = Array(test)
        let answerArray = Array(answer)
        for i in 0..<MAX_NUMBER {
            for j in 0..<MAX_NUMBER {
                //數字正確，位置正確
                if testArray[i] == answerArray[j]  && i == j {
                    resultA += 1
                    //數字正確，位置不正確（i != j）
                } else if testArray[i] == answerArray[j] {
                    resultB += 1
                }
            }
        }
        return (A: resultA, B: resultB)
    }
    
}
