//
//  DayViewController.swift
//  SkyGaze
//
//  Created by Abraham, Aneesh on 9/8/18.
//  Copyright © 2018 Ammini Inc. All rights reserved.
//

import UIKit

protocol DayViewControllerDelegate {
    func controllerDidTapSettingsButton(controller: DayViewController)
    func controllerDidTapLocationButton(controller: DayViewController)
}

class DayViewController: WeatherViewController {
    
    // MARK: - Properties
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    var delegate: DayViewControllerDelegate?
    
    var viewModel: DayViewViewModel? {
        didSet {
            updateView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    private func updateView() {
        activityIndicatorView.stopAnimating()
        
        if let viewModel = viewModel {
            updateWeatherDataContainer(withViewModel : viewModel)
        } else {
            messageLabel.isHidden = false
            messageLabel.text = "Unable to fetch weather data."
        }
    }
    
    // MARK: -
    
    private func updateWeatherDataContainer(withViewModel viewModel: DayViewViewModel) {
        
        weatherDataContainer.isHidden = false
        dateLabel.text = viewModel.date
        timeLabel.text = viewModel.time
        descriptionLabel.text = viewModel.summary
        temperatureLabel.text = viewModel.temperature
        windSpeedLabel.text = viewModel.windSpeed
        iconImageView.image = viewModel.image
    }
    
    // MARK: - Actions
    
    @IBAction func didTapSettingsButton(sender: UIButton) {
        delegate?.controllerDidTapSettingsButton(controller: self)
    }
    
    @IBAction func didTapLocationButton(sender: UIButton) {
        delegate?.controllerDidTapLocationButton(controller: self)
    }
}
