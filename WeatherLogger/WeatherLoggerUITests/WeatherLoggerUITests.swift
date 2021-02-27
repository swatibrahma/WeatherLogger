//
//  WeatherLoggerUITests.swift
//  WeatherLoggerUITests
//
//  Created by Swati on 25/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import XCTest

class WeatherLoggerUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    func testWeatherLoggerScreen() {
        let app = XCUIApplication()
        app.launch()
        addUIInterruptionMonitor(withDescription: "System Dialog") {
          (alert) -> Bool in
          alert.buttons["Allow Once"].tap()
          return true
        }
        app.tap()
        
        app.buttons["Save Weather Details"].tap()
        
        addUIInterruptionMonitor(withDescription: "System Dialog") {
          (alert) -> Bool in
          alert.buttons["Okay"].tap()
          return true
        }
        app.tap()
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
