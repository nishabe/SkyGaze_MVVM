//
//  DayViewViewModel.swift
//  SkyGaze
//
//  Created by Abraham, Aneesh on 9/17/18.
//  Copyright © 2018 Ammini Inc. All rights reserved.
//

import UIKit

struct DayViewViewModel {
    let weatherData : WeatherData
    private let dateFormatter = DateFormatter()
    private let timeFormatter = DateFormatter()
    
    var date: String {
        dateFormatter.dateFormat = "EEE MMMM d"
        return dateFormatter.string(from: weatherData.currently.time)
    }
    
    var time : String {
        timeFormatter.dateFormat = UserDefaults.timeNotation().timeFormat
        return timeFormatter.string(from: weatherData.currently.time)
    }
    
    var summary : String {
        return weatherData.currently.summary
    }
    
    var temperature : String {
        let temperature = weatherData.currently.temperature
        
        switch UserDefaults.temperatureNotation() {
        case .fahrenheit:
            return String(format: "%.f °F", temperature)
        case .celsius:
            return String(format: "%.f °C", temperature.toCelcius())
        }
    }
    
    var windSpeed : String {
        let windSpeed = weatherData.currently.windSpeed
        switch UserDefaults.unitsNotation() {
        case .imperial:
            return String(format: "%.f MPH", windSpeed)
        case .metric:
            return String(format: "%.f KPH", windSpeed.toKPH())
        }
    }
    var image : UIImage? {
        return UIImage.imageForIcon(withName: weatherData.currently.icon)
    }
}
