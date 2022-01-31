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
    func checkConnection()
    
   // func viewIsReady()
}

protocol SearchPresenterOuput: AnyObject {
//    func setStateWithEntity(with entity: SearchEntity)
    func loadBackground(backgroundName: String)
}
