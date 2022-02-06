//
//  WeatherInteractor.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import CoreLocation

protocol BasicInteractorInput {
    var output: BasicInteractorOuput? { get set }
    func locationAccess()
    func checkConnection()
    func loadWeatherForecast(with model: WeatherModel)
}

protocol BasicInteractorOuput: AnyObject {
    func updateEntity(entity: BasicEntity)
    func updateBackgroud(name: String)
}

protocol SearchInteractorInput {
    var output: SearchInteractorOuput? { get set }
    func didChooseCityFromSearch(city: String)
}

protocol SearchInteractorOuput: AnyObject {
    func updateModel(with model: WeatherModel)
}
