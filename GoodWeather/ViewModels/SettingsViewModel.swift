//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Serhan Khan on 21/04/2020.
//  Copyright © 2020 Serhan Khan. All rights reserved.
//

import Foundation

enum Unit:String,CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}


extension Unit {
    
    var displayName:String {
        get {
            switch (self) {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
    
}

struct SettingsViewModel {
    let units = Unit.allCases
   
    private var _selectedUnit: Unit = Unit.celsius
    
    var selectedUnit:Unit{
        get {
            let userDefault = UserDefaults.standard
            if let value = userDefault.value(forKey: "Unit") as? String {
                return Unit(rawValue: value)!
            }
            return _selectedUnit
        }
        
        set {
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "Unit")
        }
    }
    
}
