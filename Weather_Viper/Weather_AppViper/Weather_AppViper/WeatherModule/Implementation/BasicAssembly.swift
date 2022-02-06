//
//  BasicAssembly.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//
import UIKit
import SpriteKit

class BasicAssembly {
    static func configBasicModule() -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "BasicViewController") as? BasicViewController else { return nil }
        let presenter = BasicPresenterImp()
        let interactor = BasicInteractorImp()
        let router = BasicRouterImp()
        let locationService = LocationServiceImp()
        let weatherService = WeatherServiceImp()
        let storageService = SharedStorageImp()
        let dateFormatterService = DateFormatterServiceImp()
        let backgroudService = BackgroundServiceImp()
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = controller
        interactor.output = presenter
        interactor.locationService = locationService
        interactor.weatherService = weatherService
        interactor.storageService = storageService
        interactor.dateFormatterService = dateFormatterService
        interactor.backgroudService = backgroudService
        controller.dateFormatterService = dateFormatterService
        controller.presenter = presenter
        router.view = controller
        return controller
    }
}

class SearchAssembly {
    static func configSearchModule(output: ModuleOuput?) -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController else { return nil }
        let presenter = SearchPresenterImp()
        let interactor = SearchInteractorImp()
        let router = SearchRouterImp()
        let locationService = LocationServiceImp()
        presenter.interactor = interactor
        presenter.router = router
        presenter.output = output
        interactor.output = presenter
        interactor.locationService = locationService
        controller.presenter = presenter
        router.view = controller
        return controller
    }
}
