//
//  SearchRouterImp.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import UIKit

final class SearchRouterImp: SearchRouterInput {
    weak var view: UIViewController?
    
    func dismissSearch(output: ModuleOuput?) {
        guard let view = view else { return }
        view.dismiss(animated: true)
    }
}
