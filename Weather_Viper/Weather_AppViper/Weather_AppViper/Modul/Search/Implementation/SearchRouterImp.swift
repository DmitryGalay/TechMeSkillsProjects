//
//  SearchRouterImp.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import UIKit

final class SearchRouterImp: SearchRouterInput {
    weak var view: UIViewController?
    weak var imageView: UIImageView?
    
    func dismissSearch(output: ModuleOuput?) {
//        guard let controller = storyboard.instantiateViewController(withIdentifier: "BasicViewController") as? BasicViewController else { return nil }
//        let image = BasicPresenterImp.updateBackgroud(BasicAsse )
//        guard let view = view, let controller = BasicAssembly.configBasicModule()  else { return }
//
//        view.present(controller, animated: true, completion: nil)
        
        guard let view = view else { return }
        view.dismiss(animated: true)
    }
    
//    func updateUIImageView(named:String) {
//        guard let imageView = imageView else{ return}
//        imageView.image = UIImage(named: named)
//    }
}
