//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by 배지영 on 2016. 8. 28..
//  Copyright © 2016년 baecheese. All rights reserved.
//

import UIKit

struct Calculator {
    
    let calculatorLabelDefaultText:String = "계산한 식이 나타납니다."
    let symbolsOfOperation:[String] = ["delete", "AC", "/", "x", "-", "+", "=", "."]
}


// Calculator View and Controller

class CalculatorViewController: UIViewController {
    
    let calculatorStruct:Calculator = Calculator()
    
    @IBOutlet private var calculatingLabel: UILabel!
    @IBOutlet private var mainLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    private var calculationBrain:CalculatorModel = CalculatorModel()
    
    /* button action */
    
    @IBAction private func numberButtonAction(to sender: UIButton) {
        if sender.currentTitle == "🐙" {
            print("🐙")
        }
        else {
            self.changeCalculatingLabel((sender.titleLabel?.text)!)
            self.changeMainLabel((sender.titleLabel?.text)!)
            
            self.settingNowNumber()
            self.clickOperationButton(false)
        }
    }
    
    
    @IBAction private func operationAction(_ sender: UIButton) {
        print(sender.tag)
        
        if sender.tag == 0 {
            print("🌙")
        }
        else {
            self.clickOperationButton(true)// mainLabel에는 숫자만 나오게 해야해서
            self.changeCalculatingLabel((sender.titleLabel?.text)!)
            self.startOperation(sender.tag)
        }
    }
    
    // ["delete", "AC", "/", "x", "-", "+", "=", "."]
    //    11       12    13   14   15   16   17  18
    
    // typing -> operationButton click -> nowNumber -> typing -> operationButton click -> frist nowNumber move beforeNumber / After second text save nowNumber - ... -> result(=) button click -> frist nowNumber move beforeNumber / After second text save nowNumber / calcaulatingNumber & nowNumber operating
    
    
    
    
    /* Label Text change */
    
    private func changeCalculatingLabel(_ newText:String){
        if calculatingLabel.text == calculatorStruct.calculatorLabelDefaultText {
            calculatingLabel.text = ""
        }
        calculatingLabel.text = calculatingLabel.text! + newText
    }
    
    private func changeMainLabel(_ newText:String) {
        if Int(mainLabel.text!) == 0 {
            mainLabel.text = newText
        }
        else if canChangeMainLabelToNewNumber == true {
            mainLabel.text = newText
        }
        else {
            mainLabel.text = mainLabel.text! + newText
        }
    }
    
    
    
    // change MainLabel To NewNumber after click OperationButton
    private func clickOperationButton(_ click:Bool) {
        if click == false {
            canChangeMainLabelToNewNumber = false
            print("can not change MainLabelToNewNumber")
        }
        else {
            canChangeMainLabelToNewNumber = true
            print("can change MainLabelToNewNumber")
        }
    }
    
    private func endCalculate(_ end:Bool) -> Bool {
        if end == true {
            return true
        }
        else {
            return false
        }
    }
    
    
    // AC 눌렀을 때 text change
    private func resetLabelText() {
        calculatingLabel.text = calculatorStruct.calculatorLabelDefaultText
        mainLabel.text = "0"
    }
    
    
    ///////////////
    /* operation */
    ///////////////
    
    
    private func settingNowNumber() {
        nowNumber = Float(mainLabel.text!)!
    }
    
    
    private func isFristNumber(_ isFrist:Bool) -> Bool {
        if isFrist == true {
            isFristNumber = false
            return true
        }
        else {
            return false
        }
    }
    
    // AC 눌렀을 때
    private func resetCalculator() {
        beforeNumber = 0
        nowNumber = 0
        isFristNumber = true
        self.resetLabelText()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
