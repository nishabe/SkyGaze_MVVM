//
//  DataManager.swift
//  SkyGaze
//
//  Created by Abraham, Aneesh on 9/8/18.
//  Copyright © 2018 Ammini Inc. All rights reserved.
//

import Foundation

enum DataManagerError: Error {
    
    case unknown
    case failedRequest
    case invalidResponse
    
}

final class DataManager {
    
    typealias WeatherDataCompletion = (WeatherData?, DataManagerError?) -> ()
    
    // MARK: - Properties
    
    private let baseURL: URL
    
    // MARK: - Initialization
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    // MARK: - Requesting Data
    
    func weatherDataForLocation(latitude: Double, longitude: Double, completion: @escaping WeatherDataCompletion) {
        // Create URL
        let URL = baseURL.appendingPathComponent("\(latitude),\(longitude)")
        print("url:\(URL)")
        // Create Data Task
        URLSession.shared.dataTask(with: URL) { (data, response, error) in
            DispatchQueue.main.async {
                self.didFetchWeatherData(data: data, response: response, error: error, completion: completion)
            }
            }.resume()
    }
    
    // MARK: - Helper Methods
    
    private func didFetchWeatherData(data: Data?, response: URLResponse?, error: Error?, completion: WeatherDataCompletion) {
        if let _ = error {
            completion(nil, .failedRequest)
            
        } else if let data = data, let response = response as? HTTPURLResponse {
            if response.statusCode == 200 {
                do {
                    // Decode JSON
                    let jsonDecoder = JSONDecoder()
                    let weatherData = try jsonDecoder.decode(WeatherData.self, from: data)
                    // Invoke Completion Handler
                   completion(weatherData, nil)
                    
                }
                catch let decodeError as NSError {
                    print(decodeError)
                    // Invoke Completion Handler
                    completion(nil, .invalidResponse)
                }
                
            } else {
                completion(nil, .failedRequest)
            }
            
        } else {
            completion(nil, .unknown)
        }
    }
    
}
