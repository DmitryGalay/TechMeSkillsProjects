//
//  WeatherModel.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//
import Foundation
import CoreLocation

struct WeatherModel: Codable {
    var city: String
    var lat: CLLocationDegrees
    var long: CLLocationDegrees
}
