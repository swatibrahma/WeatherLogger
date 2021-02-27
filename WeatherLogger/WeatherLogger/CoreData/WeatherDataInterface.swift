//
//  WeatherDataInterface.swift
//  WeatherLogger
//
//  Created by Swati on 26/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import Foundation
protocol WeatherDataInterface {
    func saveData(model: WeatherViewModel,
                  completionBlock: @escaping ((Error?) -> Void))
    func retrieveData() -> Array<WeatherLog>?
}
