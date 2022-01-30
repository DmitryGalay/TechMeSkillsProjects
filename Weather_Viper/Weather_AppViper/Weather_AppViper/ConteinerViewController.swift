//
//  ConteinerViewController.swift
//  Weather_AppViper
//
//  Created by Dima on 30.01.22.
//

import UIKit

class ConteinerViewController: UIViewController {
    var controller: UIViewController!
    var presenter: BasicPresenterInput!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()
        
    }
    func config() {
        configWeatherViewController()
        //configSearchViewController()
    }
    
    func configWeatherViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let basicViewController = storyboard.instantiateViewController(withIdentifier: "BasicViewController") as? BasicViewController
        controller = basicViewController
        view.addSubview(controller.view)
        addChild(controller)
        
    }
    
    func configSearchViewController() {
        
    }
    

    

}
