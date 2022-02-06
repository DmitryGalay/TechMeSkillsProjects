//
//  SearchViewController.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import UIKit
import CoreLocation

class SearchViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
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
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        city = searchBar.text ?? ""
        presenter.didChooseCity(city: city)
        presenter.dismissSearch()
    }
}


