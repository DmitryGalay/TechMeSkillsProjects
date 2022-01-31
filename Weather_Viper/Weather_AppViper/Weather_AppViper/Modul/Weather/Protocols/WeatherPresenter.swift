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
    func showSearchScreen()
}

protocol BasicPresenterOutput: AnyObject {
    func setState(with entity: BasicEntity)
    func loadBackground(backgroundName: String)
}
