//
//  ServiceManager.swift
//  WeatherLogger
//
//  Created by Swati on 25/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import Foundation

final class ServiceManager: ServiceManagerInterface {
    
    static let shared = ServiceManager()
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func getRequest(req: ServiceRequestModel, completionBlock: @escaping ((ServiceResponseModel?, Error?) -> Void)) {
        let task = self.session.dataTask(with: req.request) { (data, response, error) in
            let httpResponse = response as? HTTPURLResponse
            let responseModel = ServiceResponseModel(data: data,
                                                     statusCode: httpResponse?.statusCode ?? 0)
            completionBlock(responseModel, error)
        }
        task.resume()
    }
}
