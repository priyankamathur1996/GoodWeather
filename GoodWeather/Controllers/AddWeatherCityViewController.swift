//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by call soft on 15/10/2019.
//  Copyright © 2019 call soft. All rights reserved.
//

import Foundation
import UIKit


protocol AddWeatherDelegate {
    func addWeatherDidSave(vm:WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController{
    
    private var addcityViewModel = AddCityViewModel()
    
    //MARK: - OUTLETS
    @IBOutlet weak var cityNameTextField: BindingTextField!{
        didSet{
            cityNameTextField.bind { self.addcityViewModel.city = $0 }
        }
    }
    @IBOutlet weak var stateTextField: BindingTextField!{
        didSet{
            stateTextField.bind { self.addcityViewModel.state = $0 }
        }
    }
    @IBOutlet weak var zipcodeTextField: BindingTextField!{
        didSet{
            zipcodeTextField.bind { self.addcityViewModel.zipcode = $0 }
        }
    }
    
    
    var delegate: AddWeatherDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
   @IBAction func saveButtonPressed()
   {
    
    print(self.addcityViewModel)
    
         if let city = cityNameTextField.text {
          
            let weatherUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=a5c629c58712d36f4640e7a34f88fc83&units=metric")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherUrl) { data in
               
                let json = JSONDecoder()
                let weatherVM = try? json.decode(WeatherViewModel.self, from: data)
                
                return weatherVM
            }
            
            Webservices().load(resource: weatherResource){ [weak self] result in
               
                if let weatherVM = result {
                    print(weatherVM)
                    if let delegate = self?.delegate {
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
         }
    
   }
    
    @IBAction func close()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
}


//            https://api.openweathermap.org/data/2.5/group?id=524901,703448,2643743&units=metric&appid=a5c629c58712d36f4640e7a34f88fc83
//            https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=a5c629c58712d36f4640e7a34f88fc83
