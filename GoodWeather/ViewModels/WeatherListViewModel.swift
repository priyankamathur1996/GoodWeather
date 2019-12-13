//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by call soft on 21/10/2019.
//  Copyright © 2019 call soft. All rights reserved.
//
import Foundation

struct WeatherListViewModel {
    
    private var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(_ vm:WeatherViewModel)
    {
        self.weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int
    {
        return self.weatherViewModels.count
    }
    
    func modelAt(_ index:Int) -> WeatherViewModel
    {
        return self.weatherViewModels[index]
    }
    
   
   
    mutating private func toFahrenheit() {
        
        weatherViewModels =  weatherViewModels.map { vm in
            var weatherModel = vm
            weatherModel.currentTemprature.temprature = (weatherModel.currentTemprature.temprature * 9/5) + 32
            return weatherModel
        }
    }
    
    mutating private func toCelcius() {
        
      weatherViewModels =  weatherViewModels.map { vm in
          var weatherModel = vm
            weatherModel.currentTemprature.temprature = (weatherModel.currentTemprature.temprature - 32) * 5/9
            
            return weatherModel
        }
    }
    
    
   
    
   mutating func updateUnit(to unit: Unit) {
        
        switch unit {
        case .celcious:
            toCelcius()
        default:
            toFahrenheit()
        }
    }
    
 
    
    
}


struct WeatherViewModel: Decodable {
    
    let name: String
    var currentTemprature: TemperatureViewModel
    
    private enum CodingKeys: String,CodingKey {
        case name
        case currentTemprature = "main"
    }
    
}



struct TemperatureViewModel : Decodable {
    
    var temprature: Double
    let tempratureMin: Double
    let tempratureMax: Double
    
    private enum CodingKeys:  String, CodingKey{
        case temprature = "temp"
        case tempratureMin = "temp_min"
        case tempratureMax = "temp_max"
        
    }
}
