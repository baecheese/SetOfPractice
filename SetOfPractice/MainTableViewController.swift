//
//  MainTableViewController.swift
//  Calculator
//
//  Created by 배지영 on 2016. 8. 28..
//  Copyright © 2016년 baecheese. All rights reserved.
//

import UIKit

struct MainTableViewData {
    
    let practiceSection:[String] = ["Calculator", "etc"]
    let practiceLow = [["Calculator basic", "Calculator deep"],["etc"]]
    let canMoveNextPage = [[true, false],[false]]
    
    // 다음 페이지가 있을 경우, lowText에 해당하는 value가 Identifier 이도록
    let nextPageIdentifier = ["Calculator basic" : "CalculatorViewController"]
}

class MainTableViewController: UITableViewController {
    
    let mainTableViewData:MainTableViewData = MainTableViewData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Status bar white font
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return mainTableViewData.practiceSection.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mainTableViewData.practiceLow[section].count
    }
    
    // sectionTitle
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mainTableViewData.practiceSection[section]
    }
    
    // cell text
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let cellArray = mainTableViewData.practiceLow[(indexPath as NSIndexPath).section]
        let cellText:String = cellArray[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = cellText
        
        return cell
    }
    
    
    // tableview delegate - cell select
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextPageArray = mainTableViewData.canMoveNextPage[(indexPath as NSIndexPath).section]
        let canMoveNextPage:Bool = nextPageArray[(indexPath as NSIndexPath).row]
        
        if canMoveNextPage == true {
            
            let lowArrayInSection = mainTableViewData.practiceLow[(indexPath as NSIndexPath).section]
            let lowText:String = lowArrayInSection[(indexPath as NSIndexPath).row]
            
            let nextPageIdentifier:String = (mainTableViewData.nextPageIdentifier[lowText])!
            
            let secondViewController = self.storyboard!.instantiateViewController(withIdentifier: nextPageIdentifier)
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
        else {
            //선택 해제 애니메이션
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
