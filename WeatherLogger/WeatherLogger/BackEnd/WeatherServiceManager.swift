//
//  WeatherServiceManager.swift
//  WeatherLogger
//
//  Created by Swati on 25/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import Foundation

final class WeatherServiceManager : WeatherServiceInterface {
    
    private let serviceManager: ServiceManagerInterface
    
    init(serviceManager: ServiceManagerInterface = ServiceManager.shared) {
        self.serviceManager = serviceManager
    }
    
    func getWeatherDetails(requestModel: WeatherModel,
                           completionBlock: @escaping ((_ details: WeatherResponseModel?, Error?) -> Void)) {
        
        let serviceURL = String(format: ServiceConstants.fetchWeather, requestModel.lat, requestModel.long)
        guard
            let url = URL(string: serviceURL) else {
            completionBlock(nil, NSError(domain: "Error",
                                         code: 0,
                                         userInfo: [NSLocalizedDescriptionKey: ServiceConstants.defaultErrorMessage]))
            return
        }
        let request = URLRequest(url: url)
        let serviceReq = ServiceRequestModel(request: request)
        self.serviceManager.getRequest(req: serviceReq) { (response, error) in
            
            do {
                if let responseData = response?.data {
                    let searchResult: WeatherResponseModel = try JSONDecoder().decode(WeatherResponseModel.self, from: responseData)
                    completionBlock(searchResult, error)
                } else {
                    completionBlock(nil, error)
                }
            } catch {
                completionBlock(nil, error)
            }
        }
    }
}
