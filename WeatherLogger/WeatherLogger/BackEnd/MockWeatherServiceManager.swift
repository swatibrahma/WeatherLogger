//
//  MockWeatherServiceManager.swift
//  WeatherLogger
//
//  Created by Swati on 25/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import Foundation

final class MockWeatherServiceManager: WeatherServiceInterface {
     var isGetWeatherCalled: Bool = false
    
     var isShowError: Bool = false
    
    func getWeatherDetails(requestModel: WeatherModel, completionBlock: @escaping ((WeatherResponseModel?, Error?) -> Void)) {
        _ = isShowError ? completionBlock(nil , showError()) : completionBlock(getResponseModel(), nil)
    }
    
    private func showError() -> Error {
        return NSError(domain: "Error", code: 1, userInfo: [:])
    }
    
    private func getResponseModel() -> WeatherResponseModel {
        isGetWeatherCalled = true
        return WeatherResponseModel(id: 1,
                                    cod: 1,
                                    timezone: 1,
                                    name: "Kolkata",
                                    base: "",
                                    weather: [Weather(id: 1,
                                                      main: "",
                                                      description: "",
                                                      icon: "")],
                                    main: Main(temp: 100,
                                               feels_like: 100,
                                               temp_min: 30,
                                               temp_max: 100,
                                               pressure: 100,
                                               humidity: 50),
                                    visibility: 100,
                                    wind: Wind(speed: 40,
                                               deg: 2,
                                               gust: 40),
                                    sys: Sys(type: 1,
                                             id: 1,
                                             sunrise: 1,
                                             sunset: 1,
                                             country: "India"),
                                    coord: Coord(lon: -122.4064,
                                                 lat: 37.7858))
    }

}
