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
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    @IBOutlet var calculatingLabel: UILabel!
    @IBOutlet var mainLabel: UILabel!
    
    var calculatingNumber:Float = 0.0
    var nowNumber:Float = 0.0
    var resultNumber:Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.settingButtonTag()
        self.settingButtonText()
        
    }
    
    /* button tag setting */
    func settingButtonTag() {
        let numberButtonList:[UIButton] = [zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton]
        
        let operationButtonList:[UIButton] = [deleteButton, resetButton, divisionButton, multiplicationButton, subtractionButton, additionButton, resultButton, dotButton]
        
        // numberButton ~ operationButton tag == 1...ButtonTatalCount
        
        var numberButtonListIndex:Int = 0
        var operationButtonListIndex:Int = 0
        
        var startTagNumber:Int = 1
        var endTagNumber:Int = numberButtonList.count
        for numberButtonTag in startTagNumber...endTagNumber {
            numberButtonList[numberButtonListIndex].tag = numberButtonTag
            print("numberButton tag 세팅 : \(numberButtonList[numberButtonListIndex]) tag = \(numberButtonList[numberButtonListIndex].tag)")
            numberButtonListIndex += 1
        }
        
        startTagNumber = numberButtonList.count+1
        endTagNumber = startTagNumber+operationButtonList.count-1
        for operationButtonTag in startTagNumber...endTagNumber {
            operationButtonList[operationButtonListIndex].tag = operationButtonTag
            print("operationButton tag 세팅 : \(operationButtonList[operationButtonListIndex]) tag = \(operationButtonList[operationButtonListIndex].tag)")
            operationButtonListIndex += 1
        }
    }
    
    /*button text setting */
    func settingButtonText() {
        let numberButtonList:[UIButton] = [zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton]
        let operationButtonList:[UIButton] = [deleteButton, resetButton, divisionButton, multiplicationButton, subtractionButton, additionButton, resultButton, dotButton]
        
        for text in 0...numberButtonList.count-1 {
            numberButtonList[text].setTitle(String(text), forState: .Normal)
            numberButtonList[text].titleLabel!.font =  UIFont(name: "Helvetica-Bold", size: 18)
        }
        
        for text in 0...operationButtonList.count-1 {
            operationButtonList[text].setTitle(calculatorStruct.symbolsOfOperation[text], forState: .Normal)
            operationButtonList[text].titleLabel!.font =  UIFont(name: "Helvetica-Bold", size: 18)
        }
        
    }
    
    /* button action */
    
    @IBAction func numberButtonAction(sender: UIButton) {
        if sender.tag == 0 {
            print("🐙")
        }
        changeCalculatingLabel((sender.titleLabel?.text)!)
        changeMainLabel((sender.titleLabel?.text)!)
    }
    
    
    @IBAction func operationAction(sender: UIButton) {
        if sender.tag == 12 {
            self.resetCalculating()
        }
        else {
        // = (result) 는 한 번만 작동 되게 --> 추후 변경 (label에선 되고 있음)
            if sender.tag == 0 {
                print("🌙")
            }
            else {
                self.startOperation(sender.tag)
                changeCalculatingLabel((sender.titleLabel?.text)!)
            }
        }
    }
    
    // ["delete", "AC", "/", "x", "-", "+", "=", "."]
    //    11       12    13   14   15   16   17  18
    
    // typing -> operationButton click -> nowNumber -> typing -> operationButton click -> frist nowNumber move calculatingNumber / After second text save nowNumber - ... -> result(=) button click -> frist nowNumber move calculatingNumber / After second text save nowNumber / calcaulatingNumber & nowNumber operating
    
    
    
    func startOperation(buttonTage:Int){
        switch buttonTage {
            
            // 연산 기호에 따른 연산  ---- chessing (하는중)
        case 11:
            // delete / AC / . ---> cheesing
            calculatingNumber += nowNumber
        case 12:
            calculatingNumber += nowNumber
        case 13:
            calculatingNumber += nowNumber
        case 14:
            calculatingNumber += nowNumber
        case 15:
            calculatingNumber += nowNumber
        case 16:
            calculatingNumber += nowNumber
            
        case 17:
            calculatingNumber -= nowNumber
        case 18:
            calculatingNumber += nowNumber
        default:
            nowNumber = 0
        }
        
        
    }
    
    /* Label Text change */
    
    func changeCalculatingLabel(newText:String){
        if calculatingLabel.text == calculatorStruct.calculatorLabelDefaultText {
            calculatingLabel.text = ""
        }
        calculatingLabel.text = calculatingLabel.text! + newText
    }
    
    func endCalculate(end:Bool) -> Bool {
        if end == true {
            return true
        }
        else {
            return false
        }
    }
    
    
    func changeMainLabel(newText:String) {
        mainLabel.text = mainLabel.text! + newText
    }
    
    // AC 눌렀을 때
    func resetLabelText() {
        calculatingLabel.text = calculatorStruct.calculatorLabelDefaultText
    }
    
    
    /* operation */
    
    func resetCalculating() {
        
        
        self.resetLabelText()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
