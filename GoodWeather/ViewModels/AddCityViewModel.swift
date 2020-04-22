//
//  AddWeatherCityViewModel.swift
//  GoodWeather
//
//  Created by Serhan Khan on 22/04/2020.
//  Copyright © 2020 Serhan Khan. All rights reserved.
//

import Foundation


struct AddCityViewModel {
    let units = Unit.allCases
    private var _selectedUnit = Unit.celsius
    
    var selectedUnit:Unit {
        get {
            let userDefault = UserDefaults.standard
            if let value = userDefault.value(forKey: "Unit") as? String {
                return Unit(rawValue: value)!
            }
            return _selectedUnit
        }
    }
    
    var city:String = ""
    var state:String = ""
    var zipCode:String = ""
    
}
 
