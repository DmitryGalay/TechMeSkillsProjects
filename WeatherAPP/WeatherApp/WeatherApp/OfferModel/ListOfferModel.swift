//
//  ListOfferModel.swift
//  WeatherApp
//
//  Created by Dima on 21.11.21.
//

import Foundation

class ListOfferModel: Codable {
    var dt: Int?
    var main: MainOfferModel?
    var dt_txt: String?
    var weather: [WeatherOfferModel]?
    var wind: WindOfferModel?
    var visibility: Double?
}

extension ListOfferModel {
    var visibilityString: String{
        return"Visibility: \(visibility! / 1000)km"
    }
}
