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
            let weatherModel = vm
            weatherModel.currentTemperature.temperature.value = (weatherModel.currentTemperature.temperature.value - 32) * 5/9
            
            weatherModel.currentTemperature.temperatureMax.value = (weatherModel.currentTemperature.temperatureMax.value - 32) * 5/9
            
            weatherModel.currentTemperature.temperatureMin.value = (weatherModel.currentTemperature.temperatureMin.value - 32) * 5/9
            
            return weatherModel
        }
    }
    
    mutating private func toFahrenheit(){
        weathersViewModel =  weathersViewModel.map{ vm in
            let weatherModel = vm
            weatherModel.currentTemperature.temperature.value = (weatherModel.currentTemperature.temperature.value * 9/5) + 32
            
            weatherModel.currentTemperature.temperatureMax.value = (weatherModel.currentTemperature.temperatureMax.value * 9/5) + 32
            
            weatherModel.currentTemperature.temperatureMin.value = (weatherModel.currentTemperature.temperatureMin.value * 9/5) + 32
            
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

//Type Eraser
class Dynamic<T>:Decodable where T:Decodable {
    
    typealias Listener = (T) -> ()
    var listener:Listener?
    
    var value:T {
        didSet{
            listener?(value)
        }
    }
    
    func bind(listener:@escaping Listener){
        self.listener = listener
        self.listener?(self.value)
    }
    
    init(_ value:T) {
        self.value = value
    }
    
    private enum CodingKeys:CodingKey {
        case value
    }
    
}


struct WeatherViewModel:Decodable {
    let name:Dynamic<String>
    var currentTemperature:TemperatureViewModel
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = Dynamic(try container.decode(String.self, forKey: .name))
        
        currentTemperature = try container.decode(TemperatureViewModel.self, forKey: .currentTemperature)
    }
    
    private enum CodingKeys:String,CodingKey {
        case name
        case currentTemperature = "main"
    }
}

struct TemperatureViewModel:Decodable {
    var temperature:Dynamic<Double>
    let temperatureMin:Dynamic<Double>
    let temperatureMax:Dynamic<Double>
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        temperature = Dynamic(try container.decode(Double.self, forKey:.temperature))
        temperatureMin = Dynamic(try container.decode(Double.self, forKey:.temperatureMin))
        temperatureMax = Dynamic(try container.decode(Double.self, forKey:.temperatureMax))
    }
    
    private enum CodingKeys : String,CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}
