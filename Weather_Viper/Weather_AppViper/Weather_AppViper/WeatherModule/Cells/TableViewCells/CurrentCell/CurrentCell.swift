//
//  CurrentCell.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import UIKit
import SnapKit

class CurrentCell: UITableViewCell {
    static let identifier = "CurrentCell"
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPurple
        view.layer.cornerRadius = 25
        return view
    }()
    
    var cityName: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 45, weight: .medium)
        text.textAlignment = .center
        text.textColor = UIColor(named: "MainColor")
        text.numberOfLines = 0
        return text
    }()
    
    var feelsLikeLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        text.textAlignment = .center
        text.textColor = UIColor(named: "MainColor")
        return text
    }()
    
    var temperatureLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 120, weight: .thin)
        text.textAlignment = .center
        text.textColor = UIColor(named: "MainColor")
        return text
    }()
    
    var descriptionWeather: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        text.textAlignment = .center
        text.textColor = UIColor(named: "MainColor")
        return text
    }()
    
    var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.tintColor = UIColor(named: "MainColor")
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }
    
    private func config() {
        configСontainerView()
        configCityLabel()
        feelsLike()
        configTemperatureLabel()
        configWeatherBasic()
    }
    
    private func configСontainerView() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        containerView.backgroundColor = .clear
    }
    
    private func configCityLabel() {
        containerView.addSubview(cityName)
        cityName.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
        }
    }
    
    private func feelsLike() {
        containerView.addSubview(feelsLikeLabel)
        feelsLikeLabel.snp.makeConstraints { make in
            make.top.equalTo(cityName.snp.bottom).offset(5)
            make.left.right.equalToSuperview()
        }
    }
    
    private func configTemperatureLabel() {
        containerView.addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(feelsLikeLabel.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
    
    private func configWeatherBasic() {
        containerView.addSubview(descriptionWeather)
        containerView.addSubview(iconImageView)
        descriptionWeather.snp.makeConstraints { make in
            make.left.equalTo(contentView.center.x)
            make.top.equalTo(temperatureLabel.snp.bottom)
            make.bottom.equalToSuperview().inset(15)
        }
        iconImageView.snp.makeConstraints { make in
            make.right.equalTo(descriptionWeather.snp.left).offset(-5)
            make.bottom.equalTo(descriptionWeather.snp.bottom)
            make.height.equalTo(descriptionWeather.snp.height)
            make.width.equalTo(iconImageView.snp.height)
        }
    }
    
    private func createWeatherIcon() {
        containerView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(descriptionWeather.snp.bottom)
            make.bottom.equalToSuperview().inset(15)
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CurrentCell", bundle: nil)
    }
}

