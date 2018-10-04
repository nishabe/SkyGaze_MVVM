//
//  WeatherData.swift
//  SkyGaze
//
//  Created by Abraham, Aneesh on 9/8/18.
//  Copyright © 2018 Ammini Inc. All rights reserved.
//

import Foundation

struct WeatherData : Decodable {
    
    let latitude: Double
    let longitude: Double
    let currently : Currently
    let daily : Daily
}

struct Currently : Decodable {
    let time: Date
    let summary: String
    let icon: String
    let temperature: Double
    let windSpeed: Double
}

struct Daily : Decodable {
    let data : [WeeklyData]
}

struct WeeklyData : Decodable {
    let time: Date
    let icon: String
    let windSpeed: Double
    let temperatureMin: Double
    let temperatureMax: Double
}

