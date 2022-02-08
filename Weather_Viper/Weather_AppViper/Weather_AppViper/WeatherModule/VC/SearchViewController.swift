//
//  SearchViewController.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import UIKit
import CoreLocation
import SVProgressHUD

class SearchViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var search: UISearchBar!
    private var city = ""
    var presenter: SearchPresenterInput!
    var delegate: BasicViewController!
    let dataService = DataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.cornerRadius = 25
        view.backgroundColor = .clear
        config()
    }
    
    private func config() {
        configSearch()
    }
    
    private func configSearch() {
        search.delegate = self
        search.layer.cornerRadius = 25
    }
    
    private func configSVProgress() {
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
        SVProgressHUD.show(withStatus: "loading..", maskType: .black)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        configSVProgress()
        searchBar.resignFirstResponder()
        city = searchBar.text ?? ""
        presenter.didChooseCity(city: city)
        presenter.dismissSearch()
    }
}
