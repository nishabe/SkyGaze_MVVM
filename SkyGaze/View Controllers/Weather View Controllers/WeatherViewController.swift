//
//  WeatherViewController.swift
//  SkyGaze
//
//  Created by Abraham, Aneesh on 9/8/18.
//  Copyright © 2018 Ammini Inc. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet var weatherDataContainer: UIView!

    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Public Interface
    
    func reloadData() {
        
    }
    
    private func updateView() {
        
    }
    
    // MARK: - View Methods
    
    private func setupView() {
        // Configure Message Label
        messageLabel.isHidden = true
        
        // Configure Weather Data Container
        weatherDataContainer.isHidden = true
        
        // Configure Activity Indicator View
        activityIndicatorView.startAnimating()
        activityIndicatorView.hidesWhenStopped = true
    }
    
    // MARK: - Helper Methods
    
    func imageForIcon(withName name: String) -> UIImage? {
        switch name {
        case "clear-day":
            return UIImage(named: "clear-day")
        case "clear-night":
            return UIImage(named: "clear-night")
        case "rain":
            return UIImage(named: "rain")
        case "snow":
            return UIImage(named: "snow")
        case "sleet":
            return UIImage(named: "sleet")
        case "wind", "cloudy", "partly-cloudy-day", "partly-cloudy-night":
            return UIImage(named: "cloudy")
        default:
            return UIImage(named: "clear-day")
        }
    }

}
