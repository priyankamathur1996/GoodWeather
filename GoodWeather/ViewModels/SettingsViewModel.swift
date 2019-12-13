//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by call soft on 22/10/2019.
//  Copyright © 2019 call soft. All rights reserved.
//

import Foundation

enum Unit: String,CaseIterable {
    
    case celcious = "metric"
    case fahrenheit = "imperial"
    
}

extension Unit{
    
    var displayName:String{
        get {
            switch (self) {
            case .celcious:
                return "Celcious"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}
 //userDefaults.set(Unit.fahrenheit.rawValue, forKey: "unit")
struct SettingsViewModel{
    
    let units = Unit.allCases
    private var _selectedUnit = Unit.fahrenheit
    
    var selectedUnit: Unit{
        get {
            let userDefaults = UserDefaults.standard
            if let value = userDefaults.value(forKey: "unit") as? String {
                return Unit(rawValue: value)!
            }
           return _selectedUnit
        }set{
            
             let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
 
}

//class Abc{
//
//     let totalSum = updatedData.value(forKey: "no_of_user_amt")
//     let totaltaxpercentage = Double(Double(totalSum)!  * Double(String(describing:updatedData.value(forKey: "tax_rate")))!) / 100
//     self.gstAmountLbl.text = "Rs.\(totaltaxpercentage)"
//     let totalamount = Double(totalSum! + totaltaxpercentage)
//     let   costPaise = totalamount * 100
//     self.costInpaise = "\(costPaise)"
//     self.totalAmountLbl.text = "Rs.\(totalamount)"
//}


