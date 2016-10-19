//
//  CalculatorModel.swift
//  SetOfPractice
//
//  Created by 배지영 on 2016. 9. 20..
//  Copyright © 2016년 baecheese. All rights reserved.
//

import Foundation


// Calculator Model API
class CalculatorModel {
    
    private var operatingSymbol:String = ""
    private var operatingNumber:Float = 0.0
    private var inputNumber:Float = 0.0
    private var resultNumber:Float = 0.0
    
    private var isFristNumber:Bool = true
    private var isFristOperation:Bool = true
    
    func setOperand(number:Float) {
        if isFristNumber == true {
            operatingNumber = number
            isFristNumber = false
        }
        else {
            inputNumber = number
        }
    }
    
    // 수학기호
    func performOperation(symbol:String) {
        if isFristOperation == true {
            operatingSymbol = symbol
            isFristOperation = false
        }
        else {
            //이전 식 먼저 계산 하고
            self.operatingBeforeNumber()
            // input 된 연산기호 저장
            operatingSymbol = symbol 
            switch symbol {
            case "=":
                resultNumber = operatingNumber
            case "AC":
                self.resetCalculator()
            default:
                inputNumber = 0
            }
        }
    }
    
    private func operatingBeforeNumber() {
        print("\(operatingNumber) \(operatingSymbol) \(inputNumber)")
        switch operatingSymbol {
        case "+":
            operatingNumber += inputNumber
        case "-":
            operatingNumber -= inputNumber
        case "x":
            operatingNumber *= inputNumber
        case "/":// 소숫점 반영하는 나누기로 변경 - ing
            operatingNumber /= inputNumber
        default:
            print("연산이 아닙니다")
            break
        }
    }
    
    // AC 눌렀을 때
    private func resetCalculator() {
        operatingSymbol = ""
        operatingNumber = 0.0
        inputNumber = 0.0
        resultNumber = 0.0
        
        isFristNumber = true
        isFristOperation = true
    }
    
    // return하는 애로 위에도 수정해야함
    // Model을 사용하는 class가 result을 설정
    var result:Float {
        get {
            print(" = \(resultNumber)")
            return resultNumber
        }
    }
}
