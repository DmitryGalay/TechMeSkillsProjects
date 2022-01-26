//
//  WeekCell.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import UIKit


class WeekCell: UICollectionViewCell {
 
    static let identifier = "WeekCell"
    
    var blurEffectView = UIVisualEffectView()
    
    let hours: UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        return textLabel
    }()
    
    let iconWeather: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    let temperature: UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont.systemFont(ofSize: 18,weight: .medium)
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        return textLabel
    }()
    
    var slashLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()

    override func prepareForReuse() {
        super.prepareForReuse()
        hours.removeFromSuperview()
        iconWeather.removeFromSuperview()
        temperature.removeFromSuperview()
    }
    
    func configCell() {
        configText()
    }
    
    private func configText() {
        contentView.addSubview(hours)
        contentView.addSubview(iconWeather)
        contentView.addSubview(temperature)
        
        hours.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(iconWeather.snp.top).offset(-10)
        }
        
        iconWeather.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(25)
            make.height.equalTo(20)
        }
        
        temperature.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(iconWeather.snp.bottom).offset(10)
        }
    }
}


