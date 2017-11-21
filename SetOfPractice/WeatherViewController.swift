//
//  WeatherViewController.swift
//  SetOfPractice
//
//  Created by 배지영 on 2017. 11. 13..
//  Copyright © 2017년 baecheese. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet weak var name = UILabel()
}

class WeatherViewController: UIViewController, WeatherManagerDelegate, UITableViewDelegate, UITableViewDataSource {

    var cityParmeter = -1
    var selectArea = ""
    let weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    override func viewWillLayoutSubviews() {
        weatherManager.getMinutelyRequest(parameterID: cityParmeter)
    }
    
    @IBOutlet var area: UILabel!
    @IBOutlet var sky: UILabel!
    @IBOutlet var temparature: UILabel!
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet var backgroundImage: UIImageView!
    var minutelyWeather = [String : Any]()
    
    func getWeather(info: [String : Any]) {
        let weather = MyJSONPaser.sharedInstance.getByQuery(query: "weather.minutely", JSONDic: info)
        if let minutely = weather as? Array<[String:Any]> {
            setBackgroundImage(info: minutely[0])
            setTopInformation(info: minutely[0])
            tableview.reloadData()
        }
    }
    
    func setBackgroundImage(info:[String:Any]) {
        if let skyCode = MyJSONPaser.sharedInstance.getByQuery(query: "sky.code", JSONDic: info) as? String {
            backgroundImage.image = UIImage(named: WeatherInfo().getSkyImageName(name: skyCode))
            backgroundImage.alpha = 0.8
        }
    }
    
    func setTopInformation(info:[String:Any]) {
        if let nowTemperature = MyJSONPaser.sharedInstance.getByQuery(query: WeatherInfo().querys["temperature.tc"]!, JSONDic: info) as? String,
            let skyCode = MyJSONPaser.sharedInstance.getByQuery(query: "sky.code", JSONDic: info) as? String {
            area.text = selectArea
            sky.text = WeatherInfo().getSkyState(code: skyCode)
            temparature.text = nowTemperature
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
