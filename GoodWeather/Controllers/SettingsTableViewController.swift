//
//  SettingsTableViewController.swift
//  GoodWeather
//
//  Created by call soft on 22/10/2019.
//  Copyright © 2019 call soft. All rights reserved.
//

import Foundation
import UIKit


protocol SettingsDelegate {
    func settingsDone(vm:SettingsViewModel)
}


class SettingsTableViewController: UITableViewController{
    
    private var settingViewModel = SettingsViewModel()
    var delegate: SettingsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    
    @IBAction func done(){
        
        if let delegate = self.delegate {
            delegate.settingsDone(vm: self.settingViewModel)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingViewModel.units.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let settingsItem = self.settingViewModel.units[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
       
        cell.textLabel?.text = settingsItem.displayName
        
        if settingsItem == self.settingViewModel.selectedUnit{
             cell.accessoryType = .checkmark
        }
       
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        //uncheck all cells
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            self.settingViewModel.selectedUnit = unit
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
}
