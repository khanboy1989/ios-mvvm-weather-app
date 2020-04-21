//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Serhan Khan on 20/04/2020.
//  Copyright © 2020 Serhan Khan. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm:WeatherViewModel)
}

class AddWeatherCityViewController:UIViewController {
    
    @IBOutlet weak var cityNameTextField:UITextField!
    
    
    var delegate:AddWeatherDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func saveCityButtonPressed(){
        if let city = cityNameTextField.text {
            let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=b4af92bbda4d0b6e66744b4df7fe1422&units=metric")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) {data in
                do {
                    let weatherVM = try JSONDecoder().decode(WeatherViewModel.self, from: data)
                    
                    print(weatherVM)
                    return weatherVM

                }catch {
                    let err = error as NSError
                    print(err.localizedDescription)
                    return nil
                }
                
            }
            Webservice().load(resource: weatherResource){ [weak self] result in
                if let weatherVM = result{
                    if let delegate = self?.delegate{
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func close(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
