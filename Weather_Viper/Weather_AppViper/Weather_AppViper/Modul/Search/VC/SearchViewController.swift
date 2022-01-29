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
    
    
    var entity: SearchEntity?
    
    let dataService = DataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        presenter.viewIsReady()
        config()
    }
    
    private func config() {
      
        configSearch()
    }

    private func configSearch() {
        search.delegate = self
        search.backgroundColor = .clear
        

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

