//
//  Constants.swift
//  Weather_Viper
//
//  Created by Dima on 26.01.22.
//

import Foundation

enum Constants {
    static let baseUrl = "https://api.openweathermap.org/data/2.5/onecall?"
    static let cityUrl = ""
    static let apiKey = "34014798c643e6767504e20f55a4769d"
}

enum StorageKey {
    static let keyForWeatherForecast = "keyForWeatherForecast"
    static let keyForLocation = "keyForLocation"
}

enum Parameters {
    
    static let lat = "lat"
    static let lon = "lon"
    static let q = "q"
    static let units = "units"
    static let metric = "metric"
    static let appid = "appid"
    static let exclude = "exclude"
    static let exclusion = "minutely"
    
}

enum Direction: String, CaseIterable {
    case N, NNE, NE, ENE, E, ESE, SE, SSE, S, SSW, SW, WSW, W, WWNW, NW, NNW
}
