//
//  CityInfo.swift
//  SetOfPractice
//
//  Created by 배지영 on 2017. 11. 21..
//  Copyright © 2017년 baecheese. All rights reserved.
//

import Foundation

struct CityInfo {
    private let citys = ["서울 강남구 도곡동", "부산", "인천", "대구"]
    private let cityParameters = [["version" : "1", "city" : "서울", "county" : "강남구", "village" : "도곡동"],
                          ["version" : "1", "city" : "서울", "county" : "강남구", "village" : "도곡동"],
                          ["version" : "1", "city" : "서울", "county" : "강남구", "village" : "도곡동"],
                          ["version" : "1", "city" : "서울", "county" : "강남구", "village" : "도곡동"]]
    
    func getAllCitys() -> [String] {
        return citys
    }
    
    func getParameter(index:Int) -> [String:String] {
        return cityParameters[index]
    }
    
}
