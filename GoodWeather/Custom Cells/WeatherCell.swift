//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Serhan Khan on 20/04/2020.
//  Copyright © 2020 Serhan Khan. All rights reserved.
//

import Foundation
import UIKit


class WeatherCell:UITableViewCell{
    
    @IBOutlet weak var cityNameLabel:UILabel!
    @IBOutlet weak var temperatureLabel:UILabel!
 
    
    func configure(_ vm:WeatherViewModel){
        self.cityNameLabel.text = vm.name
        self.temperatureLabel.text = vm.currentTemperature.temperature.formatAsDegree
    }
}
