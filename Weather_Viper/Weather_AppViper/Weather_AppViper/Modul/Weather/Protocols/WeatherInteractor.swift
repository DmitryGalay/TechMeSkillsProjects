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
}
