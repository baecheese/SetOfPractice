//
//  SelectCityTableViewController.swift
//  SetOfPractice
//
//  Created by 배지영 on 2017. 11. 21..
//  Copyright © 2017년 baecheese. All rights reserved.
//

import UIKit

class SelectCityTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CityInfo().citys.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
        cell.textLabel?.text = CityInfo().citys[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let weatherPage = storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") as? WeatherViewController {
            weatherPage.cityParmeter = indexPath.row
            weatherPage.selectArea = CityInfo().citys[indexPath.row]
            self.navigationController?.pushViewController(weatherPage, animated: true)
            print("select")
        }
    }

}
