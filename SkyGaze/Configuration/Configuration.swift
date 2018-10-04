//
//  Configuration.swift
//  SkyGaze
//
//  Created by Abraham, Aneesh on 9/8/18.
//  Copyright © 2018 Ammini Inc. All rights reserved.
//

import Foundation

struct Defaults {

    static let Latitude: Double = 43.073665
    static let Longitude: Double = -89.404454
    
}

struct API {
    
    static let APIKey = "86dbe676b00e4fd05264e0b7e8fb2769"
    static let BaseURL = URL(string: "https://api.darksky.net/forecast/")!
    
    static var AuthenticatedBaseURL: URL {
        return BaseURL.appendingPathComponent(APIKey)
    }
    
}
