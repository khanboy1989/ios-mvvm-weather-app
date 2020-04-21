//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Serhan Khan on 20/04/2020.
//  Copyright © 2020 Serhan Khan. All rights reserved.
//

import Foundation
import UIKit

class AddWeatherCityViewController:UIViewController {
    
    @IBOutlet weak var cityNameTextField:UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func saveCityButtonPressed(){
        if let city = cityNameTextField.text {
            let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=b4af92bbda4d0b6e66744b4df7fe1422&units=metric")!
            
            let weatherResource = Resource<Any>(url: weatherURL) {data in
                return data
            }
        
            Webservice().load(resource: weatherResource){result in
                
            }
            
        }
    }
    
    @IBAction func close(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
