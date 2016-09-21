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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    private var calculationBrain:CalculatorModel = CalculatorModel()
    
    /* button action */
    
    @IBAction private func numberButtonAction(_ sender: UIButton) {
        if sender.currentTitle == "🐙" {
            print("🐙")
        }
        else {
            self.changeCalculatingLabel((sender.titleLabel?.text)!)
            self.changeMainLabel((sender.titleLabel?.text)!)
            canChangeMainLabelToNewNumber = false
            //self.clickOperationButton(false)
        }
    }
    
    // (예외처리 추가하기) 두번 눌렀을 땐 한 번만 작동하게 - ing
    @IBAction private func operationAction(_ sender: UIButton) {
        let operationSymbol:String = sender.currentTitle!
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
