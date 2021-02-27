//
//  WeatherViewModel.swift
//  WeatherLogger
//
//  Created by Swati on 25/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import Foundation

struct WeatherViewModel: Codable {
    let country: String
    let city: String
    let coordinate: String
    let temperature: String
}
