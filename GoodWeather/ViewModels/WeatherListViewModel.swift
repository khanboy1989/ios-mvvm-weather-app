//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Serhan Khan on 21/04/2020.
//  Copyright © 2020 Serhan Khan. All rights reserved.
//

import Foundation

struct WeatherListViewModel {
    
    private var weathersViewModel = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(_ vm:WeatherViewModel) {
        self.weathersViewModel.append(vm)
    }
    
    func numberOfRows(_ section:Int)->Int {
        return self.weathersViewModel.count
    }
    
    func modelAt(_ index:Int) -> WeatherViewModel {
        return self.weathersViewModel[index]
    }
    
    
    mutating private func toCelsius(){
        weathersViewModel =  weathersViewModel.map{ vm in
            var weatherModel = vm
            weatherModel.currentTemperature.temperature = (weatherModel.currentTemperature.temperature - 32) * 5/9
            return weatherModel
        }
    }
    
    mutating private func toFahrenheit(){
        weathersViewModel =  weathersViewModel.map{ vm in
            var weatherModel = vm
            weatherModel.currentTemperature.temperature = (weatherModel.currentTemperature.temperature * 9/5) + 32
            return weatherModel
        }
    }
    
    mutating func updateUnit(to unit:Unit) {
        switch unit {
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
}

struct WeatherViewModel:Decodable {
    let name:String
    var currentTemperature:TemperatureViewModel
    
    private enum CodingKeys:String,CodingKey {
        case name
        case currentTemperature = "main"
    }
}

struct TemperatureViewModel:Decodable {
    var temperature:Double
    let temperatureMin:Double
    let temperatureMax:Double
    
    private enum CodingKeys : String,CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}
