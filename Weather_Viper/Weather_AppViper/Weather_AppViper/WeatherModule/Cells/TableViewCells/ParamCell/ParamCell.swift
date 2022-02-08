//
//  ParamCell.swift
//  Weather_AppViper
//
//  Created by Dima on 29.01.22.
//

import Foundation
import SnapKit

class ParamCell: UITableViewCell {
    
    static let identifier = "ParamCell"
    var isValue: Bool = false
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    var windIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "wind")
        icon.tintColor = .white
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    var windLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        text.textColor = UIColor(named: "MainColor")
        return text
    }()
    
    var windDegLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 9, weight: .semibold)
        text.textColor = UIColor(named: "MainColor")
        return text
    }()
    
    var humidityIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "humidity.fill")
        icon.tintColor = .white
        icon.contentMode = .scaleAspectFill
        return icon
    }()
    
    var humidityLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        text.textAlignment = .center
        text.textColor = UIColor(named: "MainColor")
        return text
    }()
    
    var pressureLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        text.textAlignment = .center
        text.textColor = UIColor(named: "MainColor")
        return text
    }()
    
    var pressureIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "pressure")
        icon.tintColor = .white
        icon.contentMode = .scaleAspectFill
        return icon
    }()
    
    var visibilityLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        text.textAlignment = .center
        text.textColor = UIColor(named: "MainColor")
        return text
    }()
    
    var visibilityIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "visibility")
        icon.tintColor = .white
        icon.contentMode = .scaleAspectFill
        return icon
    }()
    
    var sunriseIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "sunrise.fill")?.withRenderingMode(.alwaysOriginal)
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    var sunriseLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        text.textColor = UIColor(named: "MainColor")
        return text
    }()
    
    var sunsetIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "sunset.fill")?.withRenderingMode(.alwaysOriginal)
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    var sunsetLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        text.textColor = UIColor(named: "MainColor")
        return text
    }()
    
    static func nib() -> UINib {
        return UINib(nibName: "ParamCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }
    
    private func config() {
        configСontainerView()
        configHumidity()
        configWind()
        configSunrise()
        configSunset()
        configVisibility()
        configPressure()
    }
    
    private func configСontainerView() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        containerView.backgroundColor = .clear
        
    }
    
    private func configHumidity() {
        containerView.addSubview(humidityLabel)
        containerView.addSubview(humidityIcon)
        humidityLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView.center.x / 5)
            make.top.equalToSuperview().inset(15)
        }
        humidityIcon.snp.makeConstraints { make in
            make.right.equalTo(humidityLabel.snp.left)
            make.bottom.equalTo(humidityLabel.snp.bottom)
            make.height.equalTo(humidityLabel.snp.height)
            make.width.equalTo(humidityIcon.snp.height)
        }
        if isValue {
            humidityIcon.isHidden = true
        }
    }
    
    private func configWind() {
        containerView.addSubview(windLabel)
        containerView.addSubview(windIcon)
        containerView.addSubview(windDegLabel)
        windLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView.center.x / 5)
            make.top.equalTo(humidityLabel.snp.bottom).offset(15)
            make.bottom.equalToSuperview().inset(15)
        }
        windIcon.snp.makeConstraints { make in
            make.right.equalTo(windLabel.snp.left)
            make.bottom.equalTo(windLabel.snp.bottom)
            make.height.equalTo(humidityLabel.snp.height)
            make.width.equalTo(humidityIcon.snp.height)
        }
        windDegLabel.snp.makeConstraints { make in
            make.left.equalTo(windLabel.snp.right).offset(5)
            make.bottom.equalTo(windLabel.snp.bottom)
            make.height.equalTo(windLabel.snp.height)
            make.width.equalTo(windIcon.snp.height)
        }
//        if !isValue {
//            windIcon.isHidden = true
//        }
    }
    
    private func configSunrise() {
        containerView.addSubview(sunriseLabel)
        containerView.addSubview(sunriseIcon)
        sunriseLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.center.x)
            make.top.equalToSuperview().inset(15)
        }
        sunriseIcon.snp.makeConstraints { make in
            make.right.equalTo(sunriseLabel.snp.left)
            make.bottom.equalTo(sunriseLabel.snp.bottom)
            make.height.equalTo(sunriseLabel.snp.height)
            make.width.equalTo(sunriseIcon.snp.height)
        }
    }
    
    private func configSunset() {
        containerView.addSubview(sunsetIcon)
        containerView.addSubview(sunsetLabel)
        sunsetLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.center.x)
            make.top.equalTo(sunriseLabel.snp.bottom).offset(15)
            make.bottom.equalToSuperview().inset(15)
        }
        sunsetIcon.snp.makeConstraints { make in
            make.right.equalTo(sunsetLabel.snp.left)
            make.bottom.equalTo(sunsetLabel.snp.bottom)
            make.height.equalTo(sunsetLabel.snp.height)
            make.width.equalTo(sunsetIcon.snp.height)
        }
    }
    
    private func configVisibility() {
        containerView.addSubview(visibilityLabel)
        containerView.addSubview(visibilityIcon)
        visibilityLabel.snp.makeConstraints { make in
            make.right.equalTo(-contentView.center.x / 8)
            make.top.equalToSuperview().inset(15)
        }
        visibilityIcon.snp.makeConstraints { make in
            make.right.equalTo(visibilityLabel.snp.left)
            make.bottom.equalTo(visibilityLabel.snp.bottom)
            make.height.equalTo(visibilityLabel.snp.height)
            make.width.equalTo(visibilityIcon.snp.height)
        }
    }
    
    private func configPressure() {
        containerView.addSubview(pressureLabel)
        containerView.addSubview(pressureIcon)
        pressureLabel.snp.makeConstraints { make in
            make.right.equalTo(sunsetLabel.snp.right).offset(140)
            make.top.equalTo(visibilityLabel.snp.bottom).offset(15)
            make.bottom.equalToSuperview().inset(15)
        }
        pressureIcon.snp.makeConstraints { make in
            make.right.equalTo(pressureLabel.snp.left)
            make.bottom.equalTo(pressureLabel.snp.bottom)
            make.height.equalTo(humidityLabel.snp.height)
            make.width.equalTo(humidityIcon.snp.height)
        }
    }
}
