//
//  WeekViewModel.swift
//  SkyGaze
//
//  Created by Abraham, Aneesh on 9/17/18.
//  Copyright © 2018 Ammini Inc. All rights reserved.
//

import UIKit

struct WeekViewViewModel {
    
    let weeklyWeatherData : [WeeklyData]
    private let dayFormatter = DateFormatter()
    
    var numberOfSections : Int {
        return 1
    }
    
    var numberOfDays : Int {
        return weeklyWeatherData.count
    }
    
    func day (forIndex : Int) -> String {
        let weatherDayData = weeklyWeatherData[forIndex]
        dayFormatter.dateFormat = "EEEE"
        return dayFormatter.string(from: weatherDayData.time )
    }
    
    func date (forIndex : Int) -> String {
        let weatherDayData = weeklyWeatherData[forIndex]
        dayFormatter.dateFormat = "MMMM d"
        return dayFormatter.string(from: weatherDayData.time )
    }
    
    func temperature (forIndex : Int) -> String {
        let weatherDayData = weeklyWeatherData[forIndex]
        let min = String(format: "%.0f°", weatherDayData.temperatureMin)
        let max = String(format: "%.0f°", weatherDayData.temperatureMax)
        return "\(min)-\(max)"
    }
    
    func windSpeed(forIndex : Int) -> String {
        let weatherDayData = weeklyWeatherData[forIndex]
        let windSpeed = weatherDayData.windSpeed
        switch UserDefaults.unitsNotation() {
        case .imperial:
            return String(format: "%.f MPH", windSpeed)
        case .metric:
            return String(format: "%.f KPH", windSpeed.toKPH())
        }
    }
    
    func image(forIndex : Int) -> UIImage? {
        let weatherDayData = weeklyWeatherData[forIndex]
        return UIImage.imageForIcon(withName: weatherDayData.icon)
    }
}
