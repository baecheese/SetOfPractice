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
            self.operatingBeforeNumber()
            operatingSymbol = symbol
            inputNumber = 0
        }
//        
//            switch buttonTage {
//                
//                // 연산 기호에 따른 연산  ---- chessing (하는중)
//                //            case 11:// delete
//                //                // delete / AC / . ---> cheesing
//            //                print("delete")
//            case 12://
//                self.resetCalculator()
//            case 13:// /
//                // 소숫점 나누기 수정 요망 ---> cheesing
//                beforeNumber = Float(mainLabel.text!)!
//            case 14:// x
//                beforeNumber *= nowNumber
//            case 15:// -
//                beforeNumber -= nowNumber
//            case 16:// +
//                beforeNumber += nowNumber
//            case 17:// =
//                mainLabel.text = String(beforeNumber)
//            case 18:
//                //.button// -- default 다르니 다시 설정
//                //                self.changeCalculatingLabel((sender.titleLabel?.text)!)
//                //                self.changeMainLabel((sender.titleLabel?.text)!)
//                self.settingNowNumber()
//            default:
//                canChangeMainLabelToNewNumber = true
//                print("beforeNumber - \(beforeNumber)  nowNumber - \(nowNumber)")
//                nowNumber = 0
//            }

    }
    
    private func operatingBeforeNumber() {
        switch operatingSymbol {
        case "+":
            operatingNumber += inputNumber
        case "-":
            operatingNumber -= inputNumber
        case "x":
            operatingNumber *= inputNumber
        case "/":// 소숫점 반영하는 나누기로 변경 - ing
            operatingNumber /= inputNumber
        case "=":
            resultNumber = operatingNumber
        default:
            print("설정되지 않은 연산 입니다")
            break
        }
    }
    
    
    // Model을 사용하는 class가 result을 설정
    var result:Float {
        get {
            return resultNumber
        }
    }
}
