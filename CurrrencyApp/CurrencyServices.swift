//
//  CurrencyServices.swift
//  CurrrencyApp
//
//  Created by admin on 14/06/16.
//  Copyright © 2016 onyangowilly. All rights reserved.
//


import UIKit
class CurrencyService{
    
    
    var setting:Setting!
    
    init(){
        
        self.setting = Setting()
    }
    func getCurrencys(callback:(NSDictionary)->()){
        request(setting.Currencies, callback: callback)
        
    }
    
    func request(url:String,callback:(NSDictionary)->()) {
        guard let nsURL = NSURL(string: url) else { return }
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(nsURL) {
            
            (data, response, error) in
            guard let data = data where error == nil else { return }
            do {
                if let response = try NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers) as?[String: AnyObject] {
                    callback(response)
                }
            } catch let error as NSError {
                print("json error: \(error.localizedDescription)")
            }
            
            
        }
        task.resume()
    }
}