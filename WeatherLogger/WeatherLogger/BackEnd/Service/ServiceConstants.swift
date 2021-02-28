//
//  ServiceConstants.swift
//  WeatherLogger
//
//  Created by Swati on 25/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import Foundation

enum AppEnvironment: String {
    case Dev
    case Mock
}

final class ServiceConstants {
    static let currentEnvironment : AppEnvironment = .Dev
    static let apiKey = "22c9e4371b1d4da0d6274750e5490be3"
    static let fetchWeather = "https://api.openweathermap.org/data/2.5/weather?lat=%@&lon=%@&appid=\(apiKey)"
    static let defaultErrorMessage = "Something went wrong, please try again"
}
