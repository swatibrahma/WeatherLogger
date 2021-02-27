//
//  WeatherLoggerPresenter.swift
//  WeatherLogger
//
//  Created by Swati on 25/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import Foundation
import UIKit

final class WeatherLoggerPresenter: WeatherLoggerPresentable {
    unowned let viewController: WeatherLoggerViewControllable
    
    private let localizable: Localization
        
    init(controller: WeatherLoggerViewControllable,
         localization: Localization = Localization()) {
        self.viewController = controller
        self.localizable = localization
    }
    
    func showWeatherDetails(weatherModel: WeatherResponseModel) {
        let viewModel = makeWeatherViewModel(dataModel: weatherModel)
        viewController.showWeatherDetails(weatherModel: viewModel)
    }
    
    func showError(error: Error) {
        viewController.showError(error: error)
    }
    
    private func makeWeatherViewModel(dataModel: WeatherResponseModel) -> WeatherViewModel {
        let temperature = String(format:localizable.temperature,
                                 convertKelvinToCelsius(temp: dataModel.main.temp),
                                 convertKelvinToCelsius(temp: dataModel.main.temp_min),
                                 convertKelvinToCelsius(temp: dataModel.main.temp_max))
        
        return WeatherViewModel(country: dataModel.sys.country,
                                city: dataModel.name,
                                coordinate: String(format:localizable.coordinate,
                                                   "\(dataModel.coord.lat)",
                                                   "\(dataModel.coord.lon)"),
            temperature: temperature)
    }
    
    private func convertKelvinToCelsius(temp: Double) -> String {
        let temperature = temp - 273.15
        return "\(Float(temperature))°C"
    }
    
    func showSuccess() {
        viewController.showSuccess()
    }

}

