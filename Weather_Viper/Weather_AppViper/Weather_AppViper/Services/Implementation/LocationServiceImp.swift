//
//  LocationServiceImp.swift
//  Weather_Viper
//
//  Created by Dima on 26.01.22.
//

import CoreLocation

final class LocationServiceImp: LocationService {
    static let shared  = LocationServiceImp()
    var currentCity = ""
    
    func geoCodingCoordinates(currentLocation: CLLocation, completion: @escaping (String, CLLocationDegrees, CLLocationDegrees) -> ()) {
        let lat = currentLocation.coordinate.latitude
        let long = currentLocation.coordinate.longitude
        
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: lat, longitude: long)
        geoCoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard let placeMark = placemarks?.first else { return }
            if let city = placeMark.subAdministrativeArea {
                if self?.currentCity == "" {
                    self?.currentCity = city
                    completion(city, lat, long)
                }
            }
        }
    }
    
    func geoCodingAddress(city: String, completion: @escaping (CLLocation) -> ()) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(city) { coordinate, error in
            DispatchQueue.main.async {
                guard let location = coordinate?.first?.location else { return }
                completion(location)
            }
        }
    }
}
