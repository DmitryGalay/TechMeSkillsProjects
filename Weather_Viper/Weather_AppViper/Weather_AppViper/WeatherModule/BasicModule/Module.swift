//
//  Module.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import Foundation

protocol ModuleInput {
    var model: WeatherModel? { get set }
}

protocol ModuleOuput: AnyObject {
    func didUpdateModel(model: WeatherModel)
}
