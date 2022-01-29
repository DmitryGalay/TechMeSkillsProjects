//
//  Current.swift
//  Weather_AppViper
//
//  Created by Dima on 29.01.22.
//
struct Current: Codable {
    let sunrise: Float
    let sunset: Float
    let temp: Float
    let humidity: Float
    let wind_speed: Float
    let wind_deg: Float
    let feels_like: Float
    let visibility: Int
    let pressure: Float
    let weather: [Weather]
}


