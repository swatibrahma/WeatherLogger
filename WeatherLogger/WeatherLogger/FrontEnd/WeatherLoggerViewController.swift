//
//  WeatherLoggerViewController.swift
//  WeatherLogger
//
//  Created by Swati on 25/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

final class WeatherLoggerViewController: UIViewController {
    private let interactor: WeatherLoggerInteractorable
    
    private let localizable: Localization
    
    private let locationManager: CLLocationManager
    
    private var viewModel: WeatherViewModel?
    
    private weak var countryLabel: UILabel?
    
    private weak var cityLabel: UILabel?
    
    private weak var temperatureLabel: UILabel?
    
    private weak var coordinateLabel: UILabel?
    
    private weak var mapView: MKMapView?
    
    private weak var saveButton: UIButton?
    
    private weak var retrieveButton: UIButton?

    
    init(interactor: WeatherLoggerInteractorable,
         localization: Localization = Localization(),
         locationManager: CLLocationManager = CLLocationManager()) {
        self.interactor = interactor
        self.localizable = localization
        self.locationManager = locationManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLocationManager()
        setupBackgroundView()
        setupView()
    }
    
    private func makeLocationManager() {
        self.locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.startUpdatingLocation()
        }
    }
    
    private func setupBackgroundView() {
        let imageView = UIImageView(image: UIImage(named: "background"))
        imageView.autoresizesSubviews = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.insertSubview(imageView, at: 0)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
    }
    
    private func genericLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
    
    private func setupView() {
        self.navigationItem.title = localizable.title
        
        let parentStackView = UIStackView()
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.axis = .vertical
        parentStackView.alignment = .fill
        parentStackView.distribution = .fill
        parentStackView.spacing = 10
        view.addSubview(parentStackView)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        parentStackView.addArrangedSubview(stackView)
        
        let countryLbl = genericLabel()
        countryLbl.font = UIFont.boldSystemFont(ofSize: 30)
        countryLbl.textColor = .white
        stackView.addArrangedSubview(countryLbl)
        
        let cityLbl = genericLabel()
        cityLbl.font = UIFont(name: "Helvetica Neue", size: 30)
        cityLbl.textColor = .black
        stackView.addArrangedSubview(cityLbl)
        
        let tempLbl = genericLabel()
        tempLbl.font = UIFont.italicSystemFont(ofSize: 20)
        tempLbl.textColor = .black
        stackView.addArrangedSubview(tempLbl)
        
        let coordinateLbl = genericLabel()
        coordinateLbl.font = UIFont.systemFont(ofSize: 20)
        coordinateLbl.textColor = .black
        stackView.addArrangedSubview(coordinateLbl)
        
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(mapView)
        
        let saveBtn = makeButton(title: localizable.saveButtonTitle,
                                 backgroundColor: .brown)
        saveBtn.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
        let viewDetailsBtn = makeButton(title: localizable.retrieveWeatherData,
                                        backgroundColor: .darkGray,
                                        titleColor: .white)
        viewDetailsBtn.addTarget(self, action: #selector(retrieveButtonAction), for: .touchUpInside)
        let btnstackView = UIStackView()
        btnstackView.translatesAutoresizingMaskIntoConstraints = false
        btnstackView.axis = .horizontal
        btnstackView.distribution = .fillEqually
        btnstackView.spacing = 10
        parentStackView.addArrangedSubview(btnstackView)
        btnstackView.addArrangedSubview(saveBtn)
        btnstackView.addArrangedSubview(viewDetailsBtn)
        
        NSLayoutConstraint.activate([
            parentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            parentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            parentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            parentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        self.countryLabel = countryLbl
        self.cityLabel = cityLbl
        self.temperatureLabel = tempLbl
        self.coordinateLabel = coordinateLbl
        self.mapView = mapView
        self.saveButton = saveBtn
        self.retrieveButton = viewDetailsBtn
        view.layoutIfNeeded()
    }
    
    @objc func saveButtonAction() {
        if let model = viewModel {
            interactor.saveWeatherDetails(viewModel: model)
        } else {
            showAlert(title: localizable.errorAlertTitle,
                      message: localizable.errorAlertDesc)
        }
    }
    
    @objc func retrieveButtonAction() {
        interactor.retrieveWeatherDetails()
    }
    
    private func makeButton(title: String,
                            backgroundColor: UIColor,
                            titleColor: UIColor = .black) -> UIButton {
        let saveBtn = UIButton(type: .custom)
        saveBtn.translatesAutoresizingMaskIntoConstraints = true
        saveBtn.isEnabled = false
        saveBtn.setTitle(title, for: .normal)
        saveBtn.setTitleColor(titleColor, for: .normal)
        saveBtn.backgroundColor = backgroundColor
        saveBtn.layer.cornerRadius = 5
        saveBtn.layer.borderWidth = 1
        saveBtn.layer.borderColor = UIColor.black.cgColor
        return saveBtn
    }
    
    private func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title,
                                          message: message ,
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: self.localizable.alertOkButtonTitle,
                                       style: .default) { _ in
            }
            alert.addAction(action)
            self.present(alert, animated: true) {
            }
        }
    }
}

extension WeatherLoggerViewController: WeatherLoggerViewControllable {
    func showWeatherDetails(weatherModel: WeatherViewModel) {
        self.viewModel = weatherModel
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.countryLabel?.text = weatherModel.country
            self.cityLabel?.text = weatherModel.city
            self.temperatureLabel?.text = weatherModel.temperature
            self.coordinateLabel?.text = weatherModel.coordinate
            self.saveButton?.isEnabled = true
            self.retrieveButton?.isEnabled = true
        }
    }
    
    func showError(error: Error) {
        showAlert(title: self.localizable.errorAlertTitle,
                  message: error.localizedDescription)
    }
    
    func showSuccess() {
        showAlert(title: self.localizable.successAlertTitle,
                  message: self.localizable.successAlertDesc)
    }
}

extension WeatherLoggerViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { showError(error: NSError(domain: "", code: 1, userInfo: [:]))
            return
        }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        interactor.getWeatherDetails(model: WeatherModel(lat: "\(locValue.latitude)",
                                                         long: "\(locValue.longitude)"))
    }
}
