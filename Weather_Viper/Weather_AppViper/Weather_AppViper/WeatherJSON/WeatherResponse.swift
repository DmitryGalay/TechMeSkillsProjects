//
//  WeatherResponse.swift
//  Weather_AppViper
//
//  Created by Dima on 29.01.22.
//

struct WeatherResponse: Codable {
    let current: Current
    let hourly: [Hourly]
    let daily: [Daily]
}
