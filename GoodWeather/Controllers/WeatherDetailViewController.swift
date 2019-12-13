//
//  WeatherDetailViewController.swift
//  GoodWeather
//
//  Created by call soft on 22/10/2019.
//  Copyright © 2019 call soft. All rights reserved.
//
import Foundation
import UIKit

class WeatherDetailViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTempratureLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
 
    
    var weatherViewModel: WeatherViewModel?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if let weatherVM = weatherViewModel {
            
            cityNameLabel.text! =  "City Name : \(weatherVM.name)"
            currentTempratureLabel.text! = "Current Temprature : \(weatherVM.currentTemprature.temprature.formatAsDegree)"
            maxTempLabel.text! = "Max Temprature : \(weatherVM.currentTemprature.tempratureMax.formatAsDegree)"
            minTempLabel.text! = "Min Temprature : \(weatherVM.currentTemprature.tempratureMin.formatAsDegree)"
        }
        
    }
    
}
