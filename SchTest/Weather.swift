//
//  Weather.swift
//  SchTest
//
//  Created by Jesse Tello Jr. on 10/23/17.
//  Copyright © 2017 jt. All rights reserved.
//

import Foundation

struct Weather {
    
    var city: String
    var temp: String
    var description: String
    
    init?(json: [String: Any]) {
        guard let main = json["main"] as? [String: Any] else {
            return nil
        }
        guard let weather = json["weather"] as? [String: Any] else {
            return nil
        }
        description = weather["description"] as? String ?? ""
        temp = main["temp"] as? String ?? ""
        city = json["name"] as? String ?? ""
    }
    
    
}
