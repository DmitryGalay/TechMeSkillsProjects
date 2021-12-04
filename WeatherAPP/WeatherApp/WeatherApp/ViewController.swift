//
//  ViewController.swift
//  WeatherApp
//
//  Created by Dima on 21.11.21.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating,UITableViewDataSource, UITableViewDelegate {
    var timer = Timer()
    let height : CGFloat = 100
    var  dataIsReady: Bool = false
    private var contentView: MainView {
        return self.view as! MainView
    }
    var offerModel:OfferModel! {
        didSet{
            DispatchQueue.main.async {
                self.contentView.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.creatNavBar()
        (self.view as!MainView).tableView.dataSource = self
        (self.view as!MainView).tableView.delegate = self
        
    }
    
    private func creatNavBar() {
        self.navigationItem.title = "OpenWeather App"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let city = searchController.searchBar.text!
        timer.invalidate()
        if city.count > 1 {
            timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (timer) in
                NetworkManager.shared.getWeather(city: city,result: { (model) in
                    if model != nil {
                        self.dataIsReady = true
                        self.offerModel = model
                    }
                })
            })
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataIsReady {
            return self.offerModel!.list!.count
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let path = self.offerModel.list![indexPath.row]
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstUITableViewCell") as! FirstUITableViewCell
            cell.cityLabel.text = self.offerModel.city?.name
            cell.descrLabel.text = path.weather![indexPath.row].description
            cell.feelsLabel.text = path.main?.feels_like_string
            cell.mainTempLabel.text = path.main!.tempString
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondUITableViewCell") as! SecondUITableViewCell
            cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            cell.degLabel.text = path.wind?.degString
            cell.windLabel.text = path.wind?.speedString
            cell.pressureLabel.text = path.main?.pressureString
            cell.humidityLabel.text = path.main?.humidityString
            cell.visibilityLabel.text = path.visibilityString
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as!
                CustomTableViewCell
            cell.timeLabel.text = path.dt_txt
            cell.tempMinLabel.text = path.main!.temp_min_string
            cell.slashLabel.text = "/"
            cell.tempMaxLabel.text = path.main!.temp_max_string
            
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
