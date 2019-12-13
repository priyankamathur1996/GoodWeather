//
//  Webservices.swift
//  GoodWeather
//
//  Created by call soft on 21/10/2019.
//  Copyright © 2019 call soft. All rights reserved.
//

import Foundation


struct Resource<T> {
    
    let url:URL
    let parse:(Data) -> T?
    
}

final class Webservices{
    
    func load<T>(resource: Resource<T>,completion: @escaping (T?) -> ()){
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            print(data)
            
            if let data = data {
                
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
                
            }else{
                completion(nil)
            }
            
        }.resume()
    }
}
