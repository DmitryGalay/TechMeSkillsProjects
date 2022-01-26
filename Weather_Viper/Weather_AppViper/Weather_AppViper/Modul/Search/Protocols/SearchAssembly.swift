//
//  SearchAssembly.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import Foundation
import UIKit
class SearchAssembly {
    static func configSearchModule(output: ModuleOuput?) -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController else { return nil }
        
        let presenter = SearchPresenterImp()
        let interactor = SearchInteractorImp()
        let router = SearchRouterImp()
        
        let weatherDataService = WeatherServiceImp()
        let locationService = LocationServiceImp()
        let storageService = SharedStorageImp()
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        
        interactor.output = presenter
        interactor.weatherDataService = weatherDataService
        interactor.locationService = locationService
        interactor.storageService = storageService
        
        controller.presenter = presenter
        router.view = controller
        
        return controller
    }
}
