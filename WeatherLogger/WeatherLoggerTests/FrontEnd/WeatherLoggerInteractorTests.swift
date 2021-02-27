//
//  WeatherLoggerInteractorTests.swift
//  WeatherLoggerTests
//
//  Created by Swati on 27/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//
@testable import WeatherLogger
import XCTest

class WeatherLoggerInteractorTests: XCTestCase {
    private(set) var interactor: WeatherLoggerInteractor?
    
    private(set) var presenter = MockWeatherLoggerPresenter()
    
    private(set) var router = MockWeatherLoggerRouter()
    
    private(set) var mockService = MockWeatherServiceManager()
    

    override func setUp() {
        super.setUp()
        mockService = MockWeatherServiceManager()
        interactor = getInteractor()
        interactor?.presenter = presenter
    }
    
    func getInteractor(coreDataManager: WeatherDataInterface = WeatherDataManager()) -> WeatherLoggerInteractor? {
        return WeatherLoggerInteractor(service: mockService,
                                       coreDataManager: coreDataManager,
                                       router: router)
    }
    
    func test_getWeatherDetails_success() {
        let model = WeatherModel(lat: "23", long: "80")
        interactor?.getWeatherDetails(model: model)
        XCTAssertTrue(presenter.showWeatherDetails)
        XCTAssertEqual(presenter.weatherModel?.id, 1)
        XCTAssertEqual(presenter.weatherModel?.name, "Kolkata")
    }
    
    func test_getWeatherDetails_failure() {
        mockService.isShowError = true
        let model = WeatherModel(lat: "23", long: "80")
        interactor?.getWeatherDetails(model: model)
        XCTAssertTrue(presenter.showError)
    }

    func test_saveWeatherDetails_success() {
        let model = getViewModel()
        interactor?.saveWeatherDetails(viewModel: model)
        XCTAssertTrue(presenter.showSuccessCalled)
    }
        
    func test_retrieveWeatherDetails() {
        interactor?.retrieveWeatherDetails()
        XCTAssertTrue(router.routeToDetailScreenCalled)
    }
        
    private func getViewModel() -> WeatherViewModel{
       let model = WeatherViewModel(country: "US",
                                     city: "San Fransisco",
                                     coordinate: "23",
                                     temperature: "80")
        return model
    }

}

final class MockWeatherLoggerPresenter: WeatherLoggerPresentable {
    private(set) var showWeatherDetails: Bool = false
    
    private(set) var showError: Bool = false
    
    private(set) var showSuccessCalled: Bool = false
    
    private(set) var weatherModel: WeatherResponseModel?


    func showWeatherDetails(weatherModel: WeatherResponseModel) {
        self.weatherModel = weatherModel
        showWeatherDetails = true
    }
    
    func showError(error: Error) {
        showError = true
    }
    
    func showSuccess() {
        showSuccessCalled = true
    }
}

final class MockWeatherLoggerRouter: WeatherLoggerRoutable {
    private(set) var routeToDetailScreenCalled: Bool = false

    func routeToDetailScreen(details: Array<WeatherLog>?) {
        routeToDetailScreenCalled = true
    }
}
