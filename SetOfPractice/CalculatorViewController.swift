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
        
        // tag default가 0이니, tag를 부여받은 것은 0 이후부터인 것이 맞음
        
        for number in 0...9 {
            numberButtonList[number].tag = number
            print("🌙 \(numberButtonList[number]) tag = \(numberButtonList[number].tag)")
        }
        
        var count = 0
        for number in 10...16 {
            operationButtonList[count].tag = number
            print("🐙 \(operationButtonList[count]) tag = \(operationButtonList[count].tag)")
            count += 1
        }
    }
    
    @IBAction func numberButtonAction(sender: UIButton) {
    }
    
    
    @IBAction func operationAction(sender: UIButton) {
        //태그 없는 버튼은 기호
        
        if sender.tag == nil {
            print("🌙")
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
