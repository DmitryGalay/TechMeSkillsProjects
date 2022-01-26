//
//  WeatherService.swift
//  Weather_Viper
//
//  Created by Dima on 26.01.22.
//


import CoreLocation

protocol WeatherService {
    func loadWeatherData(lat: CLLocationDegrees, long: CLLocationDegrees, completion: @escaping (WeatherResponse) -> ())
    func prepareLoadDataRequest(lat: CLLocationDegrees, long: CLLocationDegrees) -> URL?
}
