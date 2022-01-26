//
//  WeatherRouterImp.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import UIKit

final class BasicRouterImp: BasicRouterInput {
    weak var view: UIViewController?
    
    func showSearchScreen(ouput: ModuleOuput?) {
        guard let view = view, let controller = SearchAssembly.configSearchModule(output: ouput) else { return }
        view.present(controller, animated: true)
    }
}

