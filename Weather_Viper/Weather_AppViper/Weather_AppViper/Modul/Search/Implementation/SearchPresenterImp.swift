//
//  SearchPresenterImp.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import Foundation

final class SearchPresenterImp: SearchPresenterInput {
    
    weak var view: SearchPresenterOuput?
    var interactor: SearchInteractorInput!
    var router: SearchRouterInput!
    weak var output: ModuleOuput?
    
        
    func viewIsReady() {
        interactor.configEntity()
    }
    
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
    func updateEntity(with entity: SearchEntity) {
        view?.setStateWithEntity(with: entity)
    }

}

extension SearchPresenterImp: DataServiceDelegate {
    func updateEntity(with entity: BasicEntity) {
    }
}

extension SearchPresenterImp: ModuleOuput {
    func didUpdateModel(model: WeatherModel) {
        
    }
}

