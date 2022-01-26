//
//  SearchInteractor.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import CoreLocation

protocol SearchInteractorInput {
    var output: SearchInteractorOuput? { get set }
    func didChooseCityFromSearch(city: String)
    func configEntity()
}

protocol SearchInteractorOuput: AnyObject {
    func updateModel(with model: WeatherModel)
    func updateEntity(with entity: SearchEntity)
}
