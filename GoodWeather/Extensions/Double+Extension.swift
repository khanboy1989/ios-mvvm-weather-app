//
//  Double+Extension.swift
//  GoodWeather
//
//  Created by Serhan Khan on 21/04/2020.
//  Copyright © 2020 Serhan Khan. All rights reserved.
//

import Foundation

extension Double {
    
    var formatAsDegree:String {
        return String(format:"%.0F°",self)
    }
    
}
