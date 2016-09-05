//
//  SetOfPracticeTests.swift
//  SetOfPracticeTests
//
//  Created by 배지영 on 2016. 8. 29..
//  Copyright © 2016년 baecheese. All rights reserved.
//

import XCTest
@testable import SetOfPractice

class SetOfPracticeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        self.testExample()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        var deleteButton: UIButton = UIButton()
        var divisionButton: UIButton = UIButton()
        var multiplicationButton: UIButton = UIButton()
        var subtractionButton: UIButton = UIButton()
        var additionButton: UIButton = UIButton()
        var resultButton: UIButton = UIButton()
        var dotButton: UIButton = UIButton()
        
        let calculatorStrut = Calculator()
        
        let buttonList:[UIButton] = [deleteButton, divisionButton, multiplicationButton, subtractionButton, additionButton, resultButton, dotButton]
        let operationList:[String] = calculatorStrut.symbolsOfOperation
        
        
        for number in 0...buttonList.count {
            buttonList[number].setTitle(operationList[number], forState: UIControlState.Normal)
            
            print("\(buttonList[number]) == \(operationList[number])")
        
        
        }
        
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
            self.testExample()
            
        }
    }
    
}
