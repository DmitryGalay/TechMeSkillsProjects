//
//  WeatherViewController.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.

import UIKit
import SnapKit
import Jelly

class BasicViewController: UIViewController {
    
    var timer = Timer()
    let tableView = UITableView()
    var imageView = UIImageView()
    let buttonShowSearch = UIButton()
    
    var presenter: BasicPresenterInput!
    
    var basicEntity: BasicEntity?
    let iconsDic = BasicIconsEntity()
    let backgroundEntity = BasicBackgroundEntity()
    
    var dateFormatterService: DateFormatterService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
        config()
    }
    
    private func config() {
        configTableView()
        configButton()
    }
    
    private func configTableView() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.allowsSelection = false
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CurrentCell.nib(), forCellReuseIdentifier: CurrentCell.identifier)
        tableView.register(ParamCell.nib(), forCellReuseIdentifier: ParamCell.identifier)
        tableView.register(HourlyCell.nib(), forCellReuseIdentifier: HourlyCell.identifier)
        tableView.register(DailyCell.nib(), forCellReuseIdentifier: DailyCell.indetifier)
    }
    
    private func configButton() {
        let plusIcon = UIImage(systemName: "location.magnifyingglass")
        plusIcon?.withTintColor(UIColor.black)
        
        view.addSubview(buttonShowSearch)
        
        buttonShowSearch.setBackgroundImage(plusIcon, for: .normal)
        buttonShowSearch.tintColor = UIColor(named: "MainColor")
        buttonShowSearch.addTarget(self, action: #selector(actionShowSearchScreen), for: .touchUpInside)
        
        buttonShowSearch.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.size.equalTo(25)
            make.right.equalToSuperview().inset(35)
        }
    }
    
    private func setBackgroundImage(name: String) {
                imageView = UIImageView(frame: view.bounds)
                imageView.contentMode =  .scaleAspectFill
                imageView.clipsToBounds = true
                imageView.image = UIImage(named: name)
                imageView.center = view.center
                view.addSubview(imageView)
                self.view.sendSubviewToBack(imageView)
            }
        
    
    private func setHourlyCells(cell: WeekCell, indexPath: IndexPath) {
        let dt = basicEntity?.hourly[indexPath.row].dt ?? 0
        let date = dateFormatterService.dateFormater(dt: dt, format: "HH")
        let iconName = basicEntity?.hourly[indexPath.row].weather.first?.icon
        
        for icons in iconsDic.iconsDic {
            if iconName == icons.key {
                let icon = UIImage(systemName: icons.value)?.withRenderingMode(.alwaysOriginal)
                cell.iconWeather.image = icon
            }
        }
        cell.hours.text = date
        cell.temperature.text = "\(Int(basicEntity?.hourly[indexPath.row].temp ?? 0))°"
    }
    
    private func setDayOfWeek(indexPath: IndexPath) -> String {
        guard let dt = (basicEntity?.daily[indexPath.row - 2].dt) else { return "" }
        let date = dateFormatterService.dateFormater(dt: dt, format: "EEEE")
        return date
    }
    
    private func setIcon(indexPath: IndexPath) -> UIImage? {
        let iconName = basicEntity?.daily[indexPath.row - 2].weather[0].icon
        for icons in iconsDic.iconsDic {
            if iconName == icons.key {
                let icon = UIImage(systemName: icons.value)?.withRenderingMode(.alwaysOriginal)
                return icon
            }
        }
        return UIImage(named: "")
    }
    
    private func setMinTemp(indexPath: IndexPath) -> String {
        let minTemp = "\(Int(basicEntity?.daily[indexPath.row - 2].temp.min ?? 0))°"
        return minTemp
    }
    
    private func setMaxTemp(indexPath: IndexPath) -> String {
        let maxTemp = "\(Int(basicEntity?.daily[indexPath.row - 2].temp.max ?? 0))°"
        return maxTemp
    }
    
    @objc func actionShowSearchScreen() {
        presenter.showSearchScreen()
    }
}

extension BasicViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = basicEntity?.daily.count ?? 0
        return count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrentCell.identifier, for: indexPath) as? CurrentCell else { return UITableViewCell() }
            cell.backgroundColor = .clear
            guard let forecast = basicEntity?.daily else { return UITableViewCell() }
            let daily = forecast[indexPath.row]
            let icon = daily.weather[0].icon
            guard let unwrapIcon = iconsDic.iconsDic[icon] else { return UITableViewCell() }
            cell.iconImageView.image = UIImage(systemName: unwrapIcon)
            cell.cityName.text = basicEntity?.city
            cell.temperatureLabel.text = basicEntity?.temp
            cell.descriptionWeather.text = basicEntity?.descript
           
            cell.feelsLikeLabel.text = basicEntity?.feelsLike
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ParamCell.identifier, for: indexPath) as? ParamCell else { return UITableViewCell() }
            cell.backgroundColor = UIColor(named: "ParamColor")
            cell.layer.cornerRadius = 25
            cell.humidityLabel.text = basicEntity?.humidity
            cell.windDegLabel.text = basicEntity?.wind_deg
            cell.windLabel.text = basicEntity?.wind
            cell.pressureLabel.text = basicEntity?.pressure
            cell.visibilityLabel.text = basicEntity?.visibility
            cell.sunriseLabel.text = basicEntity?.sunrise
            cell.sunsetLabel.text = basicEntity?.sunset
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HourlyCell.identifier, for: indexPath) as? HourlyCell else { return UITableViewCell() }
            cell.backgroundColor = .clear
           
            cell.setTemp = { [weak self] cell, index in
                self?.setHourlyCells(cell: cell, indexPath: index)
            }
            cell.collectionView.reloadData()
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DailyCell.indetifier, for: indexPath) as? DailyCell else { return UITableViewCell() }
//            cell.backgroundColor = .clear
            cell.backgroundColor = UIColor(named: "ParamColor")
            cell.layer.cornerRadius = 25
            cell.dayOfWeekLabel.text = setDayOfWeek(indexPath: indexPath)
            cell.iconImageView.image = setIcon(indexPath: indexPath)
            cell.minTempLabel.text = setMinTemp(indexPath: indexPath)
            cell.maxTempLabel.text = setMaxTemp(indexPath: indexPath)
            cell.slashLabel.text = "/"
            return cell
        }
    }
}

extension BasicViewController: BasicPresenterOutput {
    func loadBackground(backgroundName: String) {
        setBackgroundImage(name: backgroundName)
    }
    
    func setState(with entity: BasicEntity) {
        basicEntity = entity
        tableView.reloadData()
    }
}
