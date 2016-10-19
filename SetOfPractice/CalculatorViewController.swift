//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by 배지영 on 2016. 8. 28..
//  Copyright © 2016년 baecheese. All rights reserved.
//

import UIKit

struct CalculatorMessage {
    let calculatorLabelDefaultText:String = "계산한 식이 나타납니다."
}


// Calculator View and Controller

class CalculatorViewController: UIViewController {
    
    private let calculatorMessage:CalculatorMessage = CalculatorMessage()
    
    @IBOutlet private var calculatingLabel: UILabel!
    @IBOutlet private var mainLabel: UILabel!
    
    private var canChangeMainLabelToNewNumber:Bool = false
    private var oneCheckToCalculate:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    private var calculationBrain:CalculatorModel = CalculatorModel()
    
    /* button action */
    
    /* "."도 number에 포함 */
    @IBAction private func numberButtonAction(_ sender: UIButton) {
        if sender.currentTitle == "🐙" {
            print("🐙")
        }
        else {
            self.changeCalculatingLabel((sender.titleLabel?.text)!)
            self.changeMainLabel((sender.titleLabel?.text)!)
            canChangeMainLabelToNewNumber = false
            oneCheckToCalculate = 0
        }
    }
    
    // (예외처리 추가하기) 두번 눌렀을 땐 한 번만 작동하게 - jiring
    @IBAction private func operationAction(_ sender: UIButton) {
        
        //(예외처리) 계산 기호 두 번 눌렀을 땐 한 번만 작동하게 체크
        oneCheckToCalculate += 1
        let operationSymbol:String = sender.currentTitle!
        
        if oneCheckToCalculate == 1 {
            switch operationSymbol {
            case "🌙":
                print("🌙")
            case "AC":
                calculationBrain.performOperation(symbol: operationSymbol)
                self.resetLabelText()
            default:

                self.changeCalculatingLabel((sender.titleLabel?.text)!)
                
                let inputNumber:Float = Float(mainLabel.text!)!
                calculationBrain.setOperand(number: inputNumber)
                calculationBrain.performOperation(symbol: operationSymbol)
                canChangeMainLabelToNewNumber = true
                break
                
            }
            if sender.currentTitle == "=" {
                let result:String = String(calculationBrain.result)
                self.changeCalculatingLabel(result)
                self.changeMainLabel(result)
            }
        }
            
        else {
            //(예외처리) AC(초기화)는 여러 번 눌린 후에도 상관 없이 가능하도록 재귀
            if operationSymbol == "AC" {
                oneCheckToCalculate = 0
                operationAction(sender)
            }
            else {
            print("계산 기호 버튼이 여러번 눌렸습니다.")
            }
        }
        
    }
    
    /* Label Text change */
    
    private func changeCalculatingLabel(_ newText:String){
        if calculatingLabel.text == calculatorMessage.calculatorLabelDefaultText {
            calculatingLabel.text = ""
        }
        calculatingLabel.text = calculatingLabel.text! + newText
    }
    
    private func changeMainLabel(_ newText:String) {
        if mainLabel.text == "0" || canChangeMainLabelToNewNumber == true {
            mainLabel.text = newText
        }
        else {
            mainLabel.text = mainLabel.text! + newText
        }
    }
    
    // AC 눌렀을 때 text change
    private func resetLabelText() {
        calculatingLabel.text = calculatorMessage.calculatorLabelDefaultText
        mainLabel.text = "0"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
