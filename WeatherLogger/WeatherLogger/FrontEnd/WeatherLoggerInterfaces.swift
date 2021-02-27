//
//  WeatherLoggerInterfaces.swift
//  WeatherLogger
//
//  Created by Swati on 25/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import Foundation

protocol WeatherLoggerViewControllable: AnyObject {
    func showWeatherDetails(weatherModel: WeatherViewModel)
    func showError(error: Error)
    func showSuccess()
}

protocol WeatherLoggerPresentable {
    func showWeatherDetails(weatherModel: WeatherResponseModel)
    func showError(error: Error)
    func showSuccess()
}

protocol WeatherLoggerInteractorable {
    func getWeatherDetails(model: WeatherModel)
    func saveWeatherDetails(viewModel: WeatherViewModel)
    func retrieveWeatherDetails()
}

protocol WeatherLoggerRoutable {
    func routeToDetailScreen(details: Array<WeatherLog>?)
}

