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
   // private var name: String = ""
    var presenter: SearchPresenterInput!
     var delegate: BasicViewController!
    var entity: SearchEntity?
    
    let dataService = DataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.cornerRadius = 25
        view.backgroundColor = .clear
        //presenter.viewIsReady()
        config()
    }
    
    private func config() {
        configSearch()
    }

    private func configSearch() {
        search.delegate = self
        search.layer.cornerRadius = 25
    }
        
//    func createBAck(nameb: String) {
//        let imageNamed =
//    }
   
    
    func updateSearchResults(for searchController: UISearchController) {

    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        city = searchBar.text ?? ""
        presenter.didChooseCity(city: city)
        //presenter.checkConnection()
        presenter.dismissSearch()
       // delegate.imageView.image = UIImage(named: name)
        
//        delegate.imageView.image = UIImage(named: name)
//        delegate.imageView.image
        //presenter.view?.loadBackground(backgroundName: <#T##String#>)
    }
    
//    func setBackgroundImage(name: String) {
//        delegate.imageView.image = UIImage(named: name)
//
//    }
//}
//extension SearchViewController: SearchPresenterOuput {
//    func loadBackground(backgroundName: String) {
//        setBackgroundImage(name: backgroundName)
//    }
    
   
}


