//
//  OfferModel.swift
//  WeatherApp
//
//  Created by Dima on 21.11.21.
//

import Foundation

class OfferModel:Codable {
    var cod: String?
    var message: Float?
    var cnt: Float?
    var list:[ListOfferModel]?
    var city: CityModel?
}
