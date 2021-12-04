//
//  MainOfferModel.swift
//  WeatherApp
//
//  Created by Dima on 21.11.21.
//

import Foundation

class MainOfferModel: Codable {
    var temp: Double?
    var temp_min: Double?
    var temp_max: Double?
    var feels_like: Double?
    var humidity: Int?
    var pressure: Int?
}

extension MainOfferModel {
    var tempString: String{
        return"\(Int(temp!)) ˚C"
    }
    var temp_min_string: String {
        return"\(Int(temp_min!))"
    }
    var temp_max_string: String {
        return"\(Int(temp_max!)) ˚C"
    }
    var feels_like_string: String {
        return"Feels like: \(Int(feels_like!)) ˚C"
    }
    var humidityString: String {
        return"Humidity: \(humidity!)%"
    }
    var pressureString: String {
        return"Pressure: \(pressure!)hPa"
    }
}
