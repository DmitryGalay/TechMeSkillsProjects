//
//  BackgroundService.swift
//  Weather_AppViper
//
//  Created by Dima on 30.01.22.
//

import Foundation

protocol BackgroundService {
    func backgroudBasic(entity: BasicEntity) -> String
    
    func backgroudSearch(with mapped: WeatherResponse) -> String
}
