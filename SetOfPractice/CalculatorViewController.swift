//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by 배지영 on 2016. 8. 28..
//  Copyright © 2016년 baecheese. All rights reserved.
//

import UIKit

struct Calculator {
    
    let symbolsOfOperation:[String] = ["delete", "/", "x", "-", "+"]
}


class CalculatorViewController: UIViewController {

    let calculatorStrut = Calculator()
    
    @IBOutlet weak var deleteButton: UIButton!
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.settingButtonTag()
        
    }
    
    
    /* button 값 setting */
    func settingButtonTag() {
        let numberButtonList:[UIButton] = [zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton]
        
        let operationButtonList:[UIButton] = [deleteButton, divisionButton, multiplicationButton, subtractionButton, additionButton, resultButton, dotButton]
        
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
    
    @IBAction func numberButtonAction(sender: UIButton) {
        
        if sender.tag == 0 {
            print("🐙")
        }
        
    }
    
    
    @IBAction func operationAction(sender: UIButton) {
        
        if sender.tag == 0 {
            print("🌙 or ✨")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
