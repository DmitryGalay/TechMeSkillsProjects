//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Dima on 21.11.21.
//

import Foundation

class NetworkManager {
    private init() {}
    static let shared:NetworkManager = NetworkManager()
    
    func  getWeather(city:String, result: @escaping ((OfferModel?) -> ())) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/data/2.5/forecast"
        urlComponents.queryItems = [URLQueryItem(name: "q", value: city),
                                    URLQueryItem(name: "appid", value: "34014798c643e6767504e20f55a4769d"),
                                    URLQueryItem(name: "units", value: "metric"),
                                    //URLQueryItem(name: "cnt", value: "7"),
        ]
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        let task = URLSession(configuration: .default)
        task.dataTask(with: request) {(data,response, error) in
            if error == nil {
                let decoder = JSONDecoder()
                var decoderOfferModel: OfferModel?
                if data != nil {
                    decoderOfferModel = try? decoder.decode(OfferModel.self, from: data!)
                }
                result(decoderOfferModel)
            }else {
                print(error as Any)
            }
        }.resume()
    }
}
