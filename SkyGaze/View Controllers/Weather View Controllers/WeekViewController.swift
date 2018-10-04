//
//  WeekViewController.swift
//  SkyGaze
//
//  Created by Abraham, Aneesh on 9/8/18.
//  Copyright © 2018 Ammini Inc. All rights reserved.
//

import UIKit
protocol WeekViewControllerDelegate {
    func controllerDidRefresh(controller: WeekViewController)
}
class WeekViewController: WeatherViewController {
    
    // MARK: -
    var delegate: WeekViewControllerDelegate?
    var weekViewViewModel: WeekViewViewModel? {
        didSet {
            updateView()
        }
    }
    // MARK: - Properties
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    // MARK: - View Methods
    
    private func setupView() {
        setupTableView()
        setupRefreshControl()
    }
    
    private func updateView() {
        activityIndicatorView.stopAnimating()
        tableView.refreshControl?.endRefreshing()
        
        if let _ = weekViewViewModel {
            updateWeatherDataContainer()
            
        } else {
            messageLabel.isHidden = false
            messageLabel.text = "Unable to fetch weather data."
            
        }
    }
    
    private func setupTableView() {
        tableView.separatorInset = UIEdgeInsets.zero
    }
    
    private func setupRefreshControl() {
        // Initialize Refresh Control
        let refreshControl = UIRefreshControl()
        
        // Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(WeekViewController.didRefresh(sender:)), for: .valueChanged)
        
        // Update Table View
        tableView.refreshControl = refreshControl
    }
    
    private func updateWeatherDataContainer() {
        weatherDataContainer.isHidden = false
        tableView.reloadData()
    }
    
    // MARK: - Actions
    
    @objc func didRefresh(sender: UIRefreshControl) {
        delegate?.controllerDidRefresh(controller: self)
    }
}

extension WeekViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let weekViewViewModel = weekViewViewModel else { return 0 }
        return weekViewViewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let weekViewViewModel = weekViewViewModel else { return 0 }
        return weekViewViewModel.numberOfDays
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherDayTableViewCell.reuseIdentifier, for: indexPath) as? WeatherDayTableViewCell else { fatalError("Unexpected Table View Cell") }
        
        if let weekViewViewModel = weekViewViewModel {
            cell.configureCell(model: weekViewViewModel, atIndex: indexPath.row)
        }
        
        return cell
    }
    
}

