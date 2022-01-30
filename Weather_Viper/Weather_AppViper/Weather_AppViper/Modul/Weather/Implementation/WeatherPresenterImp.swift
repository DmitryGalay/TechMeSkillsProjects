//
//  WeatherPresenterImp.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import Foundation

final class BasicPresenterImp: BasicPresenterInput, ModuleInput {
    internal var model: WeatherModel?
    
    weak var view: BasicPresenterOutput?
    var interactor: BasicInteractorInput!
    var router: BasicRouterInput!
    
    func viewIsReady() {
        interactor.locationAccess()
        interactor.checkConnection()
       
    }
    
    func showSearchScreen() {
        router.showSearchScreen(ouput: self)
    }
}
extension BasicPresenterImp: BasicInteractorOuput {
    func updateEntity(entity: BasicEntity) {
        view?.setState(with: entity)
    }
    
    func updateBackgroud(fileName: String, color: String) {
        view?.setBackgroud(fileName: fileName, color: color)
    }
}
extension BasicPresenterImp: ModuleOuput {
    func didUpdateModel(model: WeatherModel) {
        interactor.loadWeatherForecast(with: model)
    }
}
