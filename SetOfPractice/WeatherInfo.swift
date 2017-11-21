//
//  WeatherInfo.swift
//  SetOfPractice
//
//  Created by 배지영 on 2017. 11. 21..
//  Copyright © 2017년 baecheese. All rights reserved.
//

import Foundation

struct WeatherInfo {
    func getSky(state:[String:String]) -> [String:String] {
        var newData = state
        if let skyStateName = state["name"] {
            switch skyStateName {
            case "SKY_A01" :
                newData["name"] = "맑음"
            case "SKY_A02" :
                newData["name"] = "구름 조금"
            case "SKY_A03" :
                newData["name"] = "구름 많음"
            case "SKY_A04" :
                newData["name"] = "구름많고 비"
            case "SKY_A05" :
                newData["name"] = "구름많고 눈"
            case "SKY_A06" :
                newData["name"] = "구름많고 비 또는 눈"
            case "SKY_A07" :
                newData["name"] = "흐림"
            case "SKY_A08" :
                newData["name"] = "흐리고 비"
            case "SKY_A09" :
                newData["name"] = "흐리고 눈"
            case "SKY_A10" :
                newData["name"] = "흐리고 비 또는 눈"
            case "SKY_A11" :
                newData["name"] = "흐리고 낙뢰"
            case "SKY_A12" :
                newData["name"] = "뇌우, 비"
            case "SKY_A13" :
                newData["name"] = "뇌우, 눈"
            case "SKY_A14" :
                newData["name"] = "뇌우, 비 또는 눈"
            default : break
            }
        }
        return newData
    }
}
