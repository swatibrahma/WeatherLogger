//
//  WeatherLoggerConfigurator.swift
//  WeatherLogger
//
//  Created by Swati on 25/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import UIKit

final class WeatherLoggerConfigurator {
    func configViewController(env: AppEnvironment = .Dev) -> UIViewController {
        var service: WeatherServiceInterface = WeatherServiceManager()
        let coreDataManager : WeatherDataInterface = WeatherDataManager()
        if env == .Mock {
            service = MockWeatherServiceManager()
        }
        let router = WeatherLoggerRouter()
        let interactor = WeatherLoggerInteractor(service: service,
                                                 coreDataManager: coreDataManager,
                                                 router: router)
        let viewController = WeatherLoggerViewController(interactor: interactor)
        let presenter = WeatherLoggerPresenter(controller: viewController)
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
        
    }

}
