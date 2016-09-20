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
    let symbolsOfOperation:[String] = ["delete", "AC", "/", "x", "-", "+", "=", "."]//11~
}


class CalculatorViewController: UIViewController {

    let calculatorStruct:Calculator = Calculator()
    
    @IBOutlet private var deleteButton: UIButton!
    @IBOutlet private var resetButton: UIButton!
    @IBOutlet private var divisionButton: UIButton!
    @IBOutlet private var multiplicationButton: UIButton!
    @IBOutlet private var subtractionButton: UIButton!
    @IBOutlet private var additionButton: UIButton!
    @IBOutlet private var resultButton: UIButton!
    @IBOutlet private var dotButton: UIButton!
    
    @IBOutlet private var zeroButton: UIButton!
    @IBOutlet private var oneButton: UIButton!
    @IBOutlet private var twoButton: UIButton!
    @IBOutlet private var threeButton: UIButton!
    @IBOutlet private var fourButton: UIButton!
    @IBOutlet private var fiveButton: UIButton!
    @IBOutlet private var sixButton: UIButton!
    @IBOutlet private var sevenButton: UIButton!
    @IBOutlet private var eightButton: UIButton!
    @IBOutlet private var nineButton: UIButton!
    
    @IBOutlet private var calculatingLabel: UILabel!
    @IBOutlet private var mainLabel: UILabel!
    
    private var beforeNumber:Float = 0.0
    private var nowNumber:Float = 0.0
    private var resultNumber:Float = 0.0
    
    private var isFristNumber:Bool = true
    private var canChangeMainLabelToNewNumber:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.settingButtonTag()
        self.settingButtonText()
        
    }
    
    /* button tag setting */
    private func settingButtonTag() {
        let numberButtonList:[UIButton] = [zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton]
        
        let operationButtonList:[UIButton] = [deleteButton, resetButton, divisionButton, multiplicationButton, subtractionButton, additionButton, resultButton, dotButton]
        
        // numberButton ~ operationButton tag == 1...ButtonTatalCount
        
        var numberButtonListIndex:Int = 0
        var operationButtonListIndex:Int = 0
        
        var startTagNumber:Int = 1
        var endTagNumber:Int = numberButtonList.count
        for numberButtonTag in startTagNumber...endTagNumber {
            numberButtonList[numberButtonListIndex].tag = numberButtonTag
            //print("numberButton tag 세팅 : \(numberButtonList[numberButtonListIndex]) tag = \(numberButtonList[numberButtonListIndex].tag)")
            numberButtonListIndex += 1
        }
        
        startTagNumber = numberButtonList.count+1
        endTagNumber = startTagNumber+operationButtonList.count-1
        for operationButtonTag in startTagNumber...endTagNumber {
            operationButtonList[operationButtonListIndex].tag = operationButtonTag
            //print("operationButton tag 세팅 : \(operationButtonList[operationButtonListIndex]) tag = \(operationButtonList[operationButtonListIndex].tag)")
            operationButtonListIndex += 1
        }
    }
    
    /*button text setting */
    private func settingButtonText() {
        let numberButtonList:[UIButton] = [zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton]
        let operationButtonList:[UIButton] = [deleteButton, resetButton, divisionButton, multiplicationButton, subtractionButton, additionButton, resultButton, dotButton]
        
        for text in 0...numberButtonList.count-1 {
            numberButtonList[text].setTitle(String(text), for: UIControlState())
            numberButtonList[text].titleLabel!.font =  UIFont(name: "Helvetica-Bold", size: 18)
        }
        
        for text in 0...operationButtonList.count-1 {
            operationButtonList[text].setTitle(calculatorStruct.symbolsOfOperation[text], for: UIControlState())
            operationButtonList[text].titleLabel!.font =  UIFont(name: "Helvetica-Bold", size: 18)
        }
        
    }
    
    /* button action */
    
    @IBAction private func numberButtonAction(_ sender: UIButton) {
        if sender.tag == 0 {
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
    
    
    func private startOperation(_ buttonTage:Int){
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
