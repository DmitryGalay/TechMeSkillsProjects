//
//  SearchPresenter.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import Foundation

protocol SearchPresenterInput {
    var view: SearchPresenterOuput? { get set }
    func didChooseCity(city: String)
    func dismissSearch()
    func viewIsReady()
}

protocol SearchPresenterOuput: AnyObject {
    func setStateWithEntity(with entity: SearchEntity)
}
