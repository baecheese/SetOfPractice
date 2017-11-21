//
//  WeatherManager.swift
//  SetOfPractice
//
//  Created by 배지영 on 2017. 11. 14..
//  Copyright © 2017년 baecheese. All rights reserved.
//

import UIKit
import Alamofire

protocol WeatherManagerDelegate {
    func getWeather(info:[String:Any])
}

class WeatherManager: NSObject {
    
    var delegate:WeatherManagerDelegate?
    
    override init() {
        super.init()
    }
    
    func getMinutelyRequest() {
        let weatherURL = "http://apis.skplanetx.com/weather/current/minutely"
        let header : HTTPHeaders = ["appKey" : "c7c387b5-f5f7-3342-91dd-ae532e67ced7"]
        let parameters = ["version" : "1",
                          "city" : "서울",
                          "county" : "강남구",
                          "village" : "도곡동"]
        
        Alamofire.request(weatherURL, method: .get, parameters: parameters,
                          encoding: URLEncoding.default, headers: header).responseJSON { (response) in
                            switch response.result {
                            case .success(let JSON):
                                self.arrive(info: MyJSONPaser.sharedInstance.parsingJSON(response: JSON)!)
                            case .failure(let error):
                                print(error)
                            }
        }
        // 1. sync 하게 2. request 자체를 return 3.그냥 call back
    }
    
    func arrive(info:[String:Any]) {
        delegate?.getWeather(info: info)
    }
    
}
