//
//  WeatherDetailsConfigurator.swift
//  WeatherLogger
//
//  Created by Swati on 26/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import UIKit

final class WeatherDetailsConfigurator {
    private let weatherDetails: Array<WeatherLog>?
    
    init(weatherDetails: Array<WeatherLog>?) {
        self.weatherDetails = weatherDetails
    }
    
    func configViewController() -> UIViewController {
        let viewController = WeatherDetailsViewController(weatherDetails: weatherDetails)
        return viewController
    }
}
