//
//  WeatherPresenter.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import Foundation
protocol BasicPresenterInput {
    var view: BasicPresenterOutput? { get set }
    func viewIsReady()
    func showSearch()
}

protocol BasicPresenterOutput: AnyObject {
    func createState(with entity: BasicEntity)
    func loadBackground(backgroundName: String)
}

protocol SearchPresenterInput {
    var view: SearchPresenterOuput? { get set }
    func didChooseCity(city: String)
    func dismissSearch()
}

protocol SearchPresenterOuput: AnyObject {
}

