//
//  BackgroundServiceImp.swift
//  Weather_AppViper
//
//  Created by Dima on 30.01.22.
//

import Foundation
final class BackgroundServiceImp: BackgroundService {
    let backgroundEntity = BasicBackgroundEntity()
    
    func backgroudBasic(entity: BasicEntity) -> String {
        for day in backgroundEntity.backgroundEntity{
            if entity.icon == day.key {
                let particle = day.value
                return particle
            }
        }
        return ""
    }
    
    func backgroudSearch(with mapped: WeatherResponse) -> String {
        for day in backgroundEntity.backgroundEntity{
            if mapped.current.weather.first?.icon == day.key {
                let particle = day.value
                return particle
            }
        }
        return ""
    }
}
