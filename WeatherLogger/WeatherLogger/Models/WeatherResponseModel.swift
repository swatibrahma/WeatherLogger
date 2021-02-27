//
//  WeatherResponseModel.swift
//  WeatherLogger
//
//  Created by Swati on 25/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import Foundation

struct WeatherResponseModel: Codable {
    let id, cod, timezone : Int
    let name , base : String
    let weather: [Weather]
    let main: Main
    let visibility: Double?
    let wind: Wind
    let sys: Sys
    let coord: Coord
}

struct Main: Codable {
    let temp , feels_like ,temp_min ,temp_max , pressure , humidity : Double
}

struct Weather: Codable{
    let id : Int
    let main, description, icon : String
}
struct Wind: Codable{
    let speed: Double?
    let deg : Int?
    let gust: Double?
}
struct Sys: Codable{
    let type, id ,sunrise , sunset: Int?
    let country: String
}

struct Coord: Codable{
    let lon ,lat: Double
}


