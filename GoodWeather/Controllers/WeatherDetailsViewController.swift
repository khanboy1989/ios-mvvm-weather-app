//
//  WeatherDetailsViewController.swift
//  GoodWeather
//
//  Created by Serhan Khan on 22/04/2020.
//  Copyright © 2020 Serhan Khan. All rights reserved.
//

import Foundation
import UIKit


class WeatherDetailsViewController:UIViewController {
    
    @IBOutlet weak var cityNameLabel:UILabel!
    @IBOutlet weak var currentTempLabel:UILabel!
    @IBOutlet weak var maxTempLabel:UILabel!
    @IBOutlet weak var minTempLabel:UILabel!
    
    var weatherViewModel:WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModelBindings()
    }
    
    private  func setupViewModelBindings() {
        if let weatherViewModel = self.weatherViewModel {
            weatherViewModel.name.bind {self.cityNameLabel.text = $0}
            
            weatherViewModel.currentTemperature.temperature.bind {
                self.currentTempLabel.text = $0.formatAsDegree
            }
            
            weatherViewModel.currentTemperature.temperatureMin.bind {
                self.minTempLabel.text = $0.formatAsDegree
            }
            
            weatherViewModel.currentTemperature.temperatureMax.bind{self.maxTempLabel.text = $0.formatAsDegree}
        }
    }
}
