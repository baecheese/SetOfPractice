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
        getByQuery(query: "1.2", JSONDic: ["1":["2": 1 ]])
    }
    
    func getByQuery(query:String, JSONDic:[String:Any]) -> Any? {
        var terms = query.split(separator: ".").map { String($0) }
        if let value = JSONDic[terms[0]] {
            if 1 == terms.count {
                return value
            }
            let newTerms = terms.remove(index:0)
            print("newTerms = \(newTerms)")
        }
        return nil
    }
    
    func testPerformanceExample() {
        
    }
    
}
