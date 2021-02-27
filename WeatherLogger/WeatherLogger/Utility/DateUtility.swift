//
//  DateUtility.swift
//  WeatherLogger
//
//  Created by Swati on 27/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import Foundation

struct DateUtility {
    let actualDateFormat = "yyyy-MM-dd HH:mm:ss"
    let requiredDateFormat = "dd-MMM-yyyy"
    
    func getStringFromDate(date: Date?) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = actualDateFormat
        let str = formatter.string(from: date ?? Date())
        let date = formatter.date(from: str) ?? Date()
        formatter.dateFormat = requiredDateFormat
        let dateString = formatter.string(from: date)
        return dateString
    }
}
