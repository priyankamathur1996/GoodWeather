//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by call soft on 15/10/2019.
//  Copyright © 2019 call soft. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel:UILabel!
    @IBOutlet weak var temprature:UILabel!
 
    func configure(_ vm:WeatherViewModel){
        cityNameLabel.text! = vm.name
        temprature.text! =  "\(vm.currentTemprature.temprature.formatAsDegree)"
    }
    

    
}
