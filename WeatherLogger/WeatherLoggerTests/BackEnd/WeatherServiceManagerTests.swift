//
//  WeatherServiceManagerTests.swift
//  WeatherLoggerTests
//
//  Created by Swati on 27/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//
@testable import WeatherLogger
import XCTest

class WeatherServiceManagerTests: XCTestCase {
    private(set) var weatherServiceManger: WeatherServiceManager!
    
    private let mockServiceManager = MockServiceManager()

    override func setUp() {
        super.setUp()
        weatherServiceManger = WeatherServiceManager(serviceManager: mockServiceManager)
    }
    
    func test_getWeatherDetails_success() {
        let model = WeatherModel(lat: "12", long: "21")
        weatherServiceManger.getWeatherDetails(requestModel: model, completionBlock: {(weather, error) in
            XCTAssertEqual(weather?.name, "Kolkata")
            XCTAssertEqual(weather?.base, "")
            XCTAssertEqual(weather?.sys.country, "India")
            XCTAssertEqual(weather?.main.feels_like, 100.0)
        })
        XCTAssertTrue(mockServiceManager.isGetRequestCalled)
    }

    func test_getWeatherDetails_failure() {
        mockServiceManager.mockError = true
        let model = WeatherModel(lat: "12", long: "21")
        weatherServiceManger.getWeatherDetails(requestModel: model, completionBlock: {(weather, error) in
            XCTAssertNotNil(error)
        })
        XCTAssertTrue(mockServiceManager.isGetRequestCalled)
    }
}

final class MockServiceManager: ServiceManagerInterface {
    private(set) var isGetRequestCalled: Bool = false
    
    var mockError: Bool = false

    func getRequest(req: ServiceRequestModel, completionBlock: @escaping ((ServiceResponseModel?, Error?) -> Void)) {
        self.isGetRequestCalled = true
        if mockError {
            let error = NSError(domain: "",
                                code: 0,
                                userInfo: [NSLocalizedDescriptionKey: "This is mock error"])
            completionBlock(nil, error)
        } else {
            let model = getResponseModel()
            let data = try? JSONEncoder().encode(model)
            let mockresponse = ServiceResponseModel(data: data, statusCode: 0)
            completionBlock(mockresponse, nil)
        }

    }
    
    private func getResponseModel() -> WeatherResponseModel {
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

