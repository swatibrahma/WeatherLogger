//
//  Localization.swift
//  WeatherLogger
//
//  Created by Swati on 25/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import Foundation

struct Localization {
    var title : String {
        return LocalizationUtility.localizeString(key: "weather_screen_title")
    }
    
    var errorAlertTitle : String {
        return LocalizationUtility.localizeString(key: "errorAlertTitle")
    }
    
    var errorAlertDesc : String {
        return LocalizationUtility.localizeString(key: "errorAlertDesc")
    }
    
    var alertOkButtonTitle : String {
        return LocalizationUtility.localizeString(key: "alertOkButtonTitle")
    }
    
    var temperature : String {
        return LocalizationUtility.localizeString(key: "temperature")
    }
    
    var coordinate : String {
        return LocalizationUtility.localizeString(key: "coordinate")
    }
    
    var saveButtonTitle : String {
        return LocalizationUtility.localizeString(key: "saveButtonTitle")
    }
    
    var retrieveWeatherData : String {
        return LocalizationUtility.localizeString(key: "retrieveWeatherData")
    }
    
    var successAlertTitle : String {
        return LocalizationUtility.localizeString(key: "successAlertTitle")
    }
    
    var successAlertDesc : String {
        return LocalizationUtility.localizeString(key: "successAlertDesc")
    }
    
    var weatherDetailNavTitle : String {
        return LocalizationUtility.localizeString(key: "weatherDetailNavTitle")
    }
    
    var noDataAvailable : String {
        return LocalizationUtility.localizeString(key: "noDataAvailable")
    }
    
    var noDataAvailableDesc : String {
        return LocalizationUtility.localizeString(key: "noDataAvailableDesc")
    }
    
    var dateString : String {
        return LocalizationUtility.localizeString(key: "dateString")
    }
    
}

struct LocalizationUtility {
    static func localizeString(key: String) -> String {
        return NSLocalizedString(key,
                                 tableName: "Localization",
                                 bundle: Bundle.main,
                                 value: "",
                                 comment: "")
    }
}
