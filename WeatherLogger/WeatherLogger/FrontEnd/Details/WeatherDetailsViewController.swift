//
//  WeatherDetailsViewController.swift
//  WeatherLogger
//
//  Created by Swati on 26/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import UIKit

final class WeatherDetailsViewController: UIViewController {
    private let weatherDetails: Array<WeatherLog>?
    
    private let localizable: Localization
    
    private let dateUtility: DateUtility
    
    private(set) weak var tableView: UITableView? = nil

    
    init(weatherDetails: Array<WeatherLog>?,
         localization: Localization = Localization(),
         dateUtility: DateUtility = DateUtility()) {
        self.weatherDetails = weatherDetails
        self.localizable = localization
        self.dateUtility = dateUtility
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
    }
    
    private func createTableView() {
        self.navigationItem.title = localizable.weatherDetailNavTitle
        let tableView = UITableView(frame: self.view.frame, style: .plain)
        tableView.backgroundColor = .white
        tableView.register(WeatherDetailTableCell.self,
                           forCellReuseIdentifier: "tablecell")
        tableView.dataSource = self
        tableView.delegate = self

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 0),
            self.view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 0),
            self.view.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 0),
            self.view.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 0),
        ])
        self.tableView = tableView
        
    }
}

extension WeatherDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (weatherDetails?.count != 0) ? (weatherDetails?.count ?? 0) : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell",
                                                       for: indexPath) as! WeatherDetailTableCell
            guard let details = weatherDetails,
            details.count > 0 else {
            cell.countryLbl?.text = localizable.noDataAvailable
            cell.tempLbl?.text = localizable.noDataAvailableDesc
            return  cell
        }
        cell.cityLbl?.text = details[indexPath.row].city
        cell.countryLbl?.text = details[indexPath.row].country
        cell.tempLbl?.text = details[indexPath.row].temperature
        cell.coordinateLbl?.text = details[indexPath.row].coordinate
        cell.dateLbl?.text = String(format: localizable.dateString, dateUtility.getStringFromDate(date: details[indexPath.row].date))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
