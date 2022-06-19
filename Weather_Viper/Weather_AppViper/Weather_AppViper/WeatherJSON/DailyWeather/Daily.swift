//
//  Daily.swift
//  Weather_AppViper
//
//  Created by Dima on 29.01.22.
//

struct Daily: Codable {
    let dt: Float
    let temp: Temp
    let weather: [WeatherDaily]
}
