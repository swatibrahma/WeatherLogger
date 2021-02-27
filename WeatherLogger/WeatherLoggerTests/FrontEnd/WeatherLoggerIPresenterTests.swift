//
//  WeatherLoggerIPresenterTests.swift
//  WeatherLoggerTests
//
//  Created by Swati on 27/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//
@testable import WeatherLogger
import XCTest

class WeatherLoggerIPresenterTests: XCTestCase {
    private(set) var presenter: WeatherLoggerPresenter?
    
    private(set) var viewController = MockWeatherLoggerViewController()


    override func setUp() {
        super.setUp()
        presenter = WeatherLoggerPresenter(controller: viewController,
                                           localization: Localization())
    }
    
    func test_showWeatherDetails() {
        presenter?.showWeatherDetails(weatherModel: getResponseModel())
        XCTAssertTrue(viewController.showWeatherDetails)
        XCTAssertEqual(viewController.weatherModel?.city, "Kolkata")
        XCTAssertEqual(viewController.weatherModel?.country, "India")
        XCTAssertEqual(viewController.weatherModel?.coordinate, "Lat: 37.7858 Long: -122.4064")
        XCTAssertEqual(viewController.weatherModel?.temperature, "Current Temp: -173.15°C Min Temp: -243.15°C Max Temp: -173.15°C")
    }
    
    func test_showError() {
        let error = NSError(domain: "Error", code: 1, userInfo: [:])
        presenter?.showError(error: error)
        XCTAssertTrue(viewController.showError)
    }
    
    func test_showSuccess() {
        presenter?.showSuccess()
        XCTAssertTrue(viewController.showSuccessCalled)
    }
    
    private func getResponseModel() -> WeatherResponseModel {
        return WeatherResponseModel(id: 1,
                                    cod: 1,
                                    timezone: 1,
                                    name: "Kolkata",
                                    base: "",
                                    weather: [Weather(id: 1,
                                                      main: "",
                                                      description: "",
                                                      icon: "")],
                                    main: Main(temp: 100,
                                               feels_like: 100,
                                               temp_min: 30,
                                               temp_max: 100,
                                               pressure: 100,
                                               humidity: 50),
                                    visibility: 100,
                                    wind: Wind(speed: 40,
                                               deg: 2,
                                               gust: 40),
                                    sys: Sys(type: 1,
                                             id: 1,
                                             sunrise: 1,
                                             sunset: 1,
                                             country: "India"),
                                    coord: Coord(lon: -122.4064,
                                                 lat: 37.7858))
    }
}

final class MockWeatherLoggerViewController: UIViewController, WeatherLoggerViewControllable {
    private(set) var showWeatherDetails: Bool = false
    
    private(set) var showError: Bool = false
    
    private(set) var showSuccessCalled: Bool = false
    
    private(set) var weatherModel: WeatherViewModel?

    func showWeatherDetails(weatherModel: WeatherViewModel) {
        showWeatherDetails = true
        self.weatherModel = weatherModel
    }
    
    func showError(error: Error) {
        showError = true
    }
    
    func showSuccess() {
        showSuccessCalled = true
    }
}
