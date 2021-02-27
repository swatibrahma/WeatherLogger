//
//  WeatherLoggerRouter.swift
//  WeatherLogger
//
//  Created by Swati on 26/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import Foundation

final class WeatherLoggerRouter: WeatherLoggerRoutable {
    weak var viewController: WeatherLoggerViewController?
    
    func routeToDetailScreen(details: Array<WeatherLog>?) {
        let config = WeatherDetailsConfigurator(weatherDetails: details)
        let vc = config.configViewController()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
