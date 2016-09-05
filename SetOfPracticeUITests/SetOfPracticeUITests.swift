//
//  SetOfPracticeUITests.swift
//  SetOfPracticeUITests
//
//  Created by 배지영 on 2016. 8. 29..
//  Copyright © 2016년 baecheese. All rights reserved.
//

import XCTest

class SetOfPracticeUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results
        
        
        var deleteButton: UIButton!
        var divisionButton: UIButton!
        var multiplicationButton: UIButton!
        var subtractionButton: UIButton!
        var additionButton: UIButton!
        var resultButton: UIButton!
        var dotButton: UIButton!
        
        let calculatorStrut = Calculator()
        
        let buttonList:[UIButton] = [deleteButton, divisionButton, multiplicationButton, subtractionButton, additionButton, resultButton, dotButton]
        let operationList:[String] = calculatorStrut.symbolsOfOperation
        
        
        for number in 0...buttonList.count-1 {
            
            let string = operationList[number]
            
            buttonList[number].setTitle(string , forState: UIControlState.Normal)
            
            print("\(buttonList[number]) == \(operationList[number])")
        }
        
        
    }
    
}
