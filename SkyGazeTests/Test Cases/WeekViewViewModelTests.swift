//
//  WeekViewViewModel.swift
//  SkyGazeTests
//
//  Created by Abraham, Aneesh on 9/19/18.
//  Copyright © 2018 Ammini Inc. All rights reserved.
//

import XCTest
@testable import SkyGaze_V5

class WeekViewViewModelTests: XCTestCase {
    var viewModel : WeekViewViewModel!

    override func setUp() {
        super.setUp()
        
        let data = loadStubFromFile(name: "darkSkyResponseSample", extension: "json")
        // Decode JSON
        let jsonDecoder = JSONDecoder()
        do {
            let weatherData = try jsonDecoder.decode(WeatherData.self, from: data)
            viewModel = WeekViewViewModel(weeklyWeatherData: weatherData.daily.data)
        }
        catch let decodeError as NSError {
            print(decodeError)
        }

    }
    
    func testNumberOfSections () {
        XCTAssertEqual(viewModel.numberOfSections, 1)
    }
    
    func testNumberOfDays () {
        XCTAssertEqual(viewModel.numberOfDays, 8)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    
}
