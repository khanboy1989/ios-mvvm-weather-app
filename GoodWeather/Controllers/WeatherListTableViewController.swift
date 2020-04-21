//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Serhan Khan on 20/04/2020.
//  Copyright © 2020 Serhan Khan. All rights reserved.
//

import Foundation
import UIKit


class WeatherListTableViewController:UITableViewController,AddWeatherDelegate{
    
    
    
    private var weatherListViewModel = WeatherListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true 
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController" {
            self.prepareSegueForAddWeatherCityViewController(segue: segue)
        }else if segue.identifier == "SettingsTableViewController" {
            self.prepareSegueForSettingsTableViewController(segue: segue)
        }else {
            print("segue could not be found with identifier given:\(String(describing: segue.identifier))")
        }
    }
    
    private func prepareSegueForAddWeatherCityViewController(segue:UIStoryboardSegue){
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherViewContoller not foubd")
        }
        addWeatherCityVC.delegate = self
    }
    
    
    private func prepareSegueForSettingsTableViewController(segue:UIStoryboardSegue){
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        guard let settingsViewController = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("SettingsViewControoler not foubd")
        }
        settingsViewController.delegate = self
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        cell.configure(weatherVM)
        return cell
    }
}


extension WeatherListTableViewController:SettingsDelegate{
    
    func settingsDone(vm: SettingsViewModel) {
        self.weatherListViewModel.updateUnit(to:vm.selectedUnit)
        self.tableView.reloadData()
    }
    
}
