//
//  Hourly.swift
//  Weather_AppViper
//
//  Created by Dima on 29.01.22.
//


struct Hourly: Codable {
    let dt: Float
    let temp: Float
    let weather: [WeatherHourly]
}
