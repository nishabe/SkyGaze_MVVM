//
//  Conversions.swift
//  SkyGaze
//
//  Created by Abraham, Aneesh on 9/9/18.
//  Copyright © 2018 Ammini Inc. All rights reserved.
//

import Foundation

extension Double {
    
    func toCelcius() -> Double {
        return ((self - 32.0) / 1.8)
    }
    
    func toKPH() -> Double {
        return (self * 1.609344)
    }
    
}
