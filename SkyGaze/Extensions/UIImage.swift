//
//  UIImage.swift
//  SkyGaze
//
//  Created by Abraham, Aneesh on 9/17/18.
//  Copyright © 2018 Ammini Inc. All rights reserved.
//

import UIKit

extension UIImage {
    class func imageForIcon(withName name: String) -> UIImage? {
        switch name {
        case "clear-day","clear-night","rain","snow": return UIImage(named: name)
        case "wind", "cloudy", "partly-cloudy-day", "partly-cloudy-night" : return UIImage(named: "cloudy")
        default:
            return UIImage(named: "clear-day")
        }
    }
}
