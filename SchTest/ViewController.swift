//
//  ViewController.swift
//  SchTest
//
//  Created by Jesse Tello Jr. on 10/23/17.
//  Copyright © 2017 jt. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var weatherDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
    }
    
    private func getWeather() {
        let urlString = "http://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b1b15e88fa797225412429c1c50c122a1"
        guard let requestUrl = URL(string: urlString) else { return }
        let request = URLRequest(url: requestUrl)
        let task = URLSession.shared.dataTask(with: request) { data, resonse, error in
            if let d = data {
                let json = try? JSONSerialization.jsonObject(with: d, options: [])
                if let j = json as? [String: Any] {
                    if let weather = Weather(json: j) {
                        print(weather)
                    }
                }
            }
        }
        task.resume()
    }
}

