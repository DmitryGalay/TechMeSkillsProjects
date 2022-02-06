//
//  WeatherRouter.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import UIKit

protocol BasicRouterInput {
    func showSearchScreen(ouput: ModuleOuput?)
}

protocol SearchRouterInput {
    func dismissSearch(output: ModuleOuput?)
}
