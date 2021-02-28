//
//  ServiceManagerInterface.swift
//  WeatherLogger
//
//  Created by Swati on 25/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import Foundation

struct ServiceRequestModel {
    let request: URLRequest
}

struct ServiceResponseModel {
    let data: Data?
    let statusCode: Int
}

protocol ServiceManagerInterface {
    
    func getRequest(req: ServiceRequestModel , completionBlock: @escaping ((_ res: ServiceResponseModel?, _ error: Error?) -> Void))
    
}
