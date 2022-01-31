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
    var weatherService: WeatherService!
    var backgroudService: BackgroundService!
    var dateFormatterService: DateFormatterService!
    var isConnected = false
    

    func didChooseCityFromSearch(city: String) {
        locationService.geoCodingAddress(city: city) { [weak self] location in
            self?.locationService.geoCodingCoordinates(currentLocation: location) { [weak self] city, lat, long in
                let model = WeatherModel(city: city, lat: lat, long: long)
                self?.output?.updateModel(with: model)
                
                
            }
        }
    }
//    private func getEntity() -> BasicEntity? {
//        let newData = storageService.getValue(key: StorageKey.keyForWeatherForecast)
//        guard let entity = try? JSONDecoder().decode(BasicEntity.self, from: newData) else { return nil }
//        return entity
//    }
    
    
    private func configEntity(with mapped: WeatherResponse, model: WeatherModel) {
        let path = mapped.current
        let sunrise = dateFormatterService.dateFormater(dt: path.sunrise, format: " HH:mm")
        let sunset = dateFormatterService.dateFormater(dt: path.sunset, format: " HH:mm")
        let entity = BasicEntity(city: model.city,
                                 icon: path.weatherIcon,
                                 temp: path.currentTemp,
                                 descript: path.weatherDescr,
                                 humidity: path.currentHumidity,
                                 wind: path.currentWindSpeed,
                                 wind_deg: path.currentWindDeg,
                                 sunrise: sunrise,
                                 sunset: sunset,
                                 feelsLike: path.currentFeelLike,
                                 pressure:path.currentPressure,
                                 visibility: path.currentVisibility,
                                 hourly: mapped.hourly,
                                 daily: mapped.daily)
        if !entity.city.isEmpty {
            output?.updateBackgroud(name: backgroudService.backgroudBasic(entity: entity))
            
        }
    }
    func loadWeatherForecast(with model: WeatherModel) {
        weatherService.loadWeatherData(lat: model.lat, long: model.long) { [weak self] mapped in
            self?.configEntity(with: mapped, model: model)
        }
    }
    
    func checkConnection() {
        if !isConnected {
            guard let entity = getEntity() else { return }
            output?.updateBackgroud(name: backgroudService.backgroudBasic(entity: entity))
        }
    }
    
    private func getEntity() -> BasicEntity? {
        let newData = storageService.getValue(key: StorageKey.keyForWeatherForecast)
        let entity = try? JSONDecoder().decode(BasicEntity.self, from: newData)
        return entity
    }
}
