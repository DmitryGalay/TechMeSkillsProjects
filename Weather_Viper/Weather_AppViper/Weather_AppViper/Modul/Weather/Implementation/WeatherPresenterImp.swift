//
//  WeatherPresenterImp.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import Foundation

final class BasicPresenterImp: BasicPresenterInput, ModuleInput {
    var entity: BasicEntity?
    
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
    func updateBackgroud(name: String) {
        view?.loadBackground(backgroundName:name)
    }
    
    func updateEntity(entity: BasicEntity) {
        view?.setState(with: entity)
    }
    
}
extension BasicPresenterImp: ModuleOuput {
    func didUpdateModel(model: WeatherModel) {
        interactor.loadWeatherForecast(with: model)
    }
}
