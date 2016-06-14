//
//  MasterViewController.swift
//  CurrrencyApp
//
//  Created by admin on 14/06/16.
//  Copyright © 2016 onyangowilly. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    class MasterTableViewController: UITableViewController {
        
        var currencyCollection = [Currency]()
        var service:CurrencyService!
        override func viewDidLoad() {
            
            

            
            service = CurrencyService()
            service.getCurrencys{
                (response) in
                self.loadCurrencys(response["currencys"]!as! NSArray)
                
                
                
                super.viewDidLoad()
            }
        }
        func loadCurrencys(currencys:NSArray){
            for currency in currencys{
                let base = (currency["Currency"]!!["base"] as! String)
                let date = currency["Currency"]!!["date"] as! NSDate
                let rates = currency["Currency"]!!["rate"] as! String
                let currencyobj = Currency(base:base, date:date, rates: rates)
                currencyCollection.append(currencyobj)
                dispatch_async(dispatch_get_main_queue()){
                    self.tableView.reloadData()
                    
                }
            }
            
        }
        
        // MARK: - Table View
        
        override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
        }
        
        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return currencyCollection.count
        }
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            
            let currency = currencyCollection[indexPath.row]
            cell.textLabel!.text = currency.rates
            return cell
        }
        
        
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "showDetail" {
                if let destination = segue.destinationViewController as? DetailViewController {
                let path = tableView.indexPathForSelectedRow
                let cell = tableView.cellForRowAtIndexPath(path!)
                destination.detailDescription = (cell?.textLabel?.text)!
                }
            
            
            }
        }
        override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
            _=tableView.indexPathForSelectedRow!
            if let _ = tableView.cellForRowAtIndexPath(indexPath){
                self.performSegueWithIdentifier("showDetail", sender: indexPath)
            }
        
        }
            
    
        
}

}