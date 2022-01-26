//
//  WeatherServiceImp.swift
//  Weather_Viper
//
//  Created by Dima on 26.01.22.
//

import UIKit
import CoreLocation

class WeatherServiceImp: WeatherService {
   let storageService: SharedStorage = SharedStorageImp()
   

   func loadWeatherData(lat: CLLocationDegrees, long: CLLocationDegrees, completion: @escaping (WeatherResponse) -> ()) {
       let session = URLSession.shared
       let request: URLRequest = URLRequest(url: prepareLoadDataRequest(lat: lat, long: long)!)
       let task = session.dataTask(with: request) { data, response, error in
           guard let data = data else {
               return
           }
           do {
               let mapped = try JSONDecoder().decode(WeatherResponse.self, from: data)
               DispatchQueue.main.async {
                   completion(mapped)
               }
           } catch let error {
               print(error)
           }
       }
       task.resume()
   }
   
   func prepareLoadDataRequest(lat: CLLocationDegrees, long: CLLocationDegrees) -> URL? {
       var components = URLComponents(string: Constants.baseUrl)
       components?.queryItems = [URLQueryItem(name: Parameters.lat, value: "\(lat)"),
                                 URLQueryItem(name: Parameters.lon, value: "\(long)"),
                                 URLQueryItem(name: Parameters.exclude, value: Parameters.exclusion),
                                 URLQueryItem(name: Parameters.units, value: Parameters.metric),
                                 URLQueryItem(name: Parameters.appid, value: Constants.apiKey)]
       return components?.url
   }
}
