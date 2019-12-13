//
//  WeatherListTableviewController.swift
//  GoodWeather
//
//  Created by call soft on 15/10/2019.
//  Copyright © 2019 call soft. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableviewController: UITableViewController, AddWeatherDelegate{
    
    private var weatherListViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
        print(vm.name )
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.numberOfRows(section)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "AddWeatherCityViewController"
        {
            prepareForSegueForAddWeatherCityViewController(segue: segue)
        }else if segue.identifier == "SettingsTableViewController"
        {
            prepareForSegueForSettingsTableViewController(segue: segue)
        }else if segue.identifier == "WeatherDetailViewController"{
            prepareForSegueForWeatherDetailController(segue:segue)
        }
        
        
        
    }
    
    private func prepareForSegueForSettingsTableViewController(segue:UIStoryboardSegue){
        
        guard let nav = segue.destination as? UINavigationController else{
            fatalError("Navigation Error")
        }
        
        guard let settingsTVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("AddWeatherCity Not found")
        }
        settingsTVC.delegate = self
    }
    
    private func prepareForSegueForAddWeatherCityViewController(segue:UIStoryboardSegue){
        guard let nav = segue.destination as? UINavigationController else{
            fatalError("Navigation Error")
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCity Not found")
        }
        addWeatherCityVC.delegate = self
    }
    
    private func prepareForSegueForWeatherDetailController(segue:UIStoryboardSegue){
        
        
        guard let WeatherDetailVC = segue.destination as? WeatherDetailViewController ,
            let indexPath = self.tableView.indexPathForSelectedRow else{
                return
            }
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        WeatherDetailVC.weatherViewModel = weatherVM
        
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


extension WeatherListTableviewController: SettingsDelegate {
   
    
    func settingsDone(vm: SettingsViewModel) {
       self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
    
    
}
