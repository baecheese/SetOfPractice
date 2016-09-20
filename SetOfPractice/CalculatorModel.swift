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
    
    private var beforeNumber:Float = 0.0
    private var nowNumber:Float = 0.0
    private var resultNumber:Float = 0.0
    
    private var isFristNumber:Bool = true
    private var canChangeMainLabelToNewNumber:Bool = false
    
    func setOperand(operand:Double) {
        startOperation(<#T##buttonTage: Int##Int#>)
    }
    
    private func startOperation(buttonTage:Int){
        if isFristNumber(isFristNumber) {
            beforeNumber = nowNumber
            nowNumber = 0
            
        }
        else {
            
            //////////
            
            switch buttonTage {
                
                // 연산 기호에 따른 연산  ---- chessing (하는중)
                //            case 11:// delete
                //                // delete / AC / . ---> cheesing
            //                print("delete")
            case 12://
                self.resetCalculator()
            case 13:// /
                // 소숫점 나누기 수정 요망 ---> cheesing
                beforeNumber = Float(mainLabel.text!)!
            case 14:// x
                beforeNumber *= nowNumber
            case 15:// -
                beforeNumber -= nowNumber
            case 16:// +
                beforeNumber += nowNumber
            case 17:// =
                mainLabel.text = String(beforeNumber)
            case 18:
                //.button// -- default 다르니 다시 설정
                //                self.changeCalculatingLabel((sender.titleLabel?.text)!)
                //                self.changeMainLabel((sender.titleLabel?.text)!)
                self.settingNowNumber()
            default:
                canChangeMainLabelToNewNumber = true
                print("beforeNumber - \(beforeNumber)  nowNumber - \(nowNumber)")
                nowNumber = 0
            }
        }
        
    }
    
    // 수학기호
    func performOperation(symbol:String) {
        
    }
    
    // Model을 사용하는 class가 result을 설정
    var result:Double {
        get {
            return 0.0
        }
    }
}
