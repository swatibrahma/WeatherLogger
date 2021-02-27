//
//  WeatherLoggerInteractor.swift
//  WeatherLogger
//
//  Created by Swati on 25/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import Foundation

final class WeatherLoggerInteractor: WeatherLoggerInteractorable {
    var presenter: WeatherLoggerPresentable?
    
    private let service: WeatherServiceInterface
    
    private let coreDataManager: WeatherDataInterface
    
    private let router: WeatherLoggerRoutable

    
    init(service: WeatherServiceInterface,
         coreDataManager: WeatherDataInterface,
         router: WeatherLoggerRoutable) {
        self.service = service
        self.coreDataManager = coreDataManager
        self.router = router
    }
    
    func getWeatherDetails(model: WeatherModel) {
        service.getWeatherDetails(
            requestModel: model,
            completionBlock: { (details, error) in
                if let newError = error {
                    self.presenter?.showError(error: newError)
                } else {
                    if let model = details {
                        self.presenter?.showWeatherDetails(weatherModel: model)
                    }
                }
        })
    }
    
    func saveWeatherDetails(viewModel: WeatherViewModel) {
        coreDataManager.saveData(model: viewModel, completionBlock: { error in
            if let err = error {
                self.presenter?.showError(error: err)
            }
            else {
               self.presenter?.showSuccess()
            }
            
        })
    }
    
    func retrieveWeatherDetails() {
        let details = coreDataManager.retrieveData()
        router.routeToDetailScreen(details: details)
    }

}
