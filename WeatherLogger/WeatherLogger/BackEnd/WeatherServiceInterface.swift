//
//  WeatherServiceInterface.swift
//  WeatherLogger
//
//  Created by Swati on 25/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherServiceInterface {
    func getWeatherDetails(requestModel: WeatherModel,
                           completionBlock: @escaping ((_ details: WeatherResponseModel?, Error?) -> Void))

}
