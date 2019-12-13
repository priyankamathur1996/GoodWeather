//
//  BindingTextField.swift
//  GoodWeather
//
//  Created by call soft on 22/10/2019.
//  Copyright © 2019 call soft. All rights reserved.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
    
    
    var textChangeClosures: (String) -> () = { _ in}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func bind(callback: @escaping (String) -> ()){
        self.textChangeClosures = callback
    }
    
    private func  commonInit(){
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textfield:UITextField){
     
        if let text = textfield.text{
            self.textChangeClosures(text)
        }
        
    }
}
