//
//  WeatherInteractorImp.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import CoreLocation

final class BasicInteractorImp: NSObject, BasicInteractorInput {
    weak var output: BasicInteractorOuput?
    
    var locationService: LocationService!
    var weatherService: WeatherService!
    var storageService: SharedStorage!
    var dateFormatterService: DateFormatterService!
    
    var locationManager = CLLocationManager()
    var currentLocation = CLLocation()
    
    var dataService: DataService?
    
    var entity: BasicEntity?
        
    var isConnected = false
    
    func locationAccess() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    private func configEntity(with mapped: WeatherResponse, model: WeatherModel) {
        let city = model.city
        let icon = mapped.current.weather.first?.icon ?? ""
        let temp = "\(Int(mapped.current.temp))°"
        let wind = " : \(Int(mapped.current.wind_speed)) m/s"
        let humidity = " : \(Int(mapped.current.humidity))%"
        let descript = mapped.current.weather.first?.main ?? ""
        let sunrise = dateFormatterService.dateFormater(dt: mapped.current.sunrise, format: " HH:mm")
        let sunset = dateFormatterService.dateFormater(dt: mapped.current.sunset, format: " HH:mm")
        let feelsLike = "Feels like: \(Int(mapped.current.feels_like))°"
        let entity = BasicEntity(city: city,
                                icon: icon,
                                temp: temp,
                                descript: descript,
                                humidity: humidity,
                                wind: wind,
                                sunrise: sunrise,
                                sunset: sunset,
                                feelsLike: feelsLike,
                                hourly: mapped.hourly,
                                daily: mapped.daily)
        if !entity.city.isEmpty {
            saveEntity(entity: entity)
            output?.updateEntity(entity: entity)
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
            output?.updateEntity(entity: entity)
        }
    }
    
    private func saveEntity(entity: BasicEntity) {
        let data = try? JSONEncoder().encode(entity)
        storageService.setValue(key: StorageKey.keyForWeatherForecast, value: data)
    }
    
    private func getEntity() -> BasicEntity? {
        let newData = storageService.getValue(key: StorageKey.keyForWeatherForecast)
        let entity = try? JSONDecoder().decode(BasicEntity.self, from: newData)
        return entity
    }
}

extension BasicInteractorImp: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty {
            self.currentLocation = locations.first ?? CLLocation()
            self.locationManager.stopUpdatingLocation()
            locationService.geoCodingCoordinates(currentLocation: currentLocation) { [weak self] city, lat, long in
                let newModel = WeatherModel(city: city, lat: lat, long: long)
                self?.loadWeatherForecast(with: newModel)
                self?.isConnected = true
            }
        }
    }
}
