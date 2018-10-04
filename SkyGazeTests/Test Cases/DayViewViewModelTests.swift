//
//  DayViewViewModelTests.swift
//  SkyGazeTests
//
//  Created by Abraham, Aneesh on 9/19/18.
//  Copyright © 2018 Ammini Inc. All rights reserved.
//

import XCTest
@testable import SkyGaze_V5

class DayViewViewModelTests: XCTestCase {
    var viewModel : DayViewViewModel!
    
    override func setUp() {
        super.setUp()
        
        let data = loadStubFromFile(name: "darkSkyResponseSample", extension: "json")
        // Decode JSON
        let jsonDecoder = JSONDecoder()
        do {
            let weatherData = try jsonDecoder.decode(WeatherData.self, from: data)
            viewModel =  DayViewViewModel (weatherData: weatherData)
        }
        catch let decodeError as NSError {
            print(decodeError)
        }

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testData() {
        print(viewModel.date)
        XCTAssertEqual(viewModel.date, "Sat September 18")
    }
}
