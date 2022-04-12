//
//  LocationService.swift
//  Weather_Viper
//
//  Created by Dima on 26.01.22.
//

import CoreLocation

protocol LocationService {
    func geoCodingCoordinates(currentLocation: CLLocation, completion: @escaping (String, CLLocationDegrees, CLLocationDegrees) -> ())
    
    func geoCodingAddress(city: String, completion: @escaping (CLLocation) -> ())
}
