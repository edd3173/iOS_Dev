//
//  WeatherManager.swift
//  Clima
//
//  Created by 원성현 on 2022/03/05.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager{
    var weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=0702c1bf586882f614160d72b15ae1e5&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
       performRequest(urlString: urlString)
        
    }
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error: ))
            task.resume()
        }
    }
    
    // completed
    func handle(data: Data?, response: URLResponse?, error:Error?) -> Void{
        if error != nil{
            print(error!)
            return
        }
        
        if let safeData = data{
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
