//
//  BasicPresenterImp.swift
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
    
    func showSearch() {
        router.showSearch(ouput: self)
    }
}
extension BasicPresenterImp: BasicInteractorOuput {
    func updateBackgroud(name: String) {
        view?.loadBackground(backgroundName:name)
    }
    
    func updateEntity(entity: BasicEntity) {
        view?.createState(with: entity)
    }
    
}
extension BasicPresenterImp: ModuleOuput {
    func didUpdateModel(model: WeatherModel) {
        interactor.loadWeatherForecast(with: model)
    }
}

final class SearchPresenterImp: SearchPresenterInput {

    weak var view: SearchPresenterOuput?
    var interactor: SearchInteractorInput!
    var router: SearchRouterInput!
    weak var output: ModuleOuput?

    func didChooseCity(city: String) {
        interactor.didChooseCityFromSearch(city: city)
        
    }
    func dismissSearch() {
        router.dismissSearch(output: self)
    }
}

extension SearchPresenterImp: SearchInteractorOuput {
    
    func updateModel(with model: WeatherModel) {
        output?.didUpdateModel(model: model)
    }

}
extension SearchPresenterImp: ModuleOuput {
    func didUpdateModel(model: WeatherModel) {
    }
}
