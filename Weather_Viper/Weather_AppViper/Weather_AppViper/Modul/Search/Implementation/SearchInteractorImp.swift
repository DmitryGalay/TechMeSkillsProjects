//
//  SearchInteractorImp.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import CoreLocation

final class SearchInteractorImp: SearchInteractorInput {
    var output: SearchInteractorOuput?
    
    var weatherDataService: WeatherService!
    var locationService: LocationService!
    var storageService: SharedStorage!

    func didChooseCityFromSearch(city: String) {
        locationService.geoCodingAddress(city: city) { [weak self] location in
            self?.locationService.geoCodingCoordinates(currentLocation: location) { [weak self] city, lat, long in
                let model = WeatherModel(city: city, lat: lat, long: long)
                self?.output?.updateModel(with: model)
            }
        }
    }
    private func getEntity() -> BasicEntity? {
        let newData = storageService.getValue(key: StorageKey.keyForWeatherForecast)
        guard let entity = try? JSONDecoder().decode(BasicEntity.self, from: newData) else { return nil }
        return entity
    }
    
    func configEntity() {
        guard let entity = getEntity() else { return }
        let city = entity.city
        let descript = entity.descript
        let temp = entity.temp
        let feelsLike = entity.feelsLike
        let newEntity = SearchEntity(city: city,
                                       descript: descript,
                                       temp: temp,
                                       feelsLike: feelsLike,
                                       currentTime: " ")
        output?.updateEntity(with: newEntity)
    }
}
