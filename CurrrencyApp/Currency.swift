//
//  Currency.swift
//  CurrrencyApp
//
//  Created by admin on 14/06/16.
//  Copyright © 2016 onyangowilly. All rights reserved.
//

import UIKit
class Currency{
    var base:String?
    var date:NSDate?
    var rates:String?
    
    init(base:String,date:NSDate,rates:String){
        self.base = base
        self.date = date
        self.rates = rates
       
    }
    
    func toJSON()->String{
        return ""
    }
    
}
