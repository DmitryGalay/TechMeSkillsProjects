//
//  WeekCell.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import UIKit


class WeekCell: UICollectionViewCell {
    static let identifier = "WeekCell"
    
    let timeLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        textLabel.textColor = UIColor(named: "MainColor")
        textLabel.textAlignment = .center
        return textLabel
    }()
    
    let iconWeather: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    let tempLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont.systemFont(ofSize: 18,weight: .medium)
        textLabel.textColor = UIColor(named: "MainColor")
        textLabel.textAlignment = .center
        return textLabel
    }()

    override func prepareForReuse() {
        super.prepareForReuse()
        timeLabel.removeFromSuperview()
        iconWeather.removeFromSuperview()
        tempLabel.removeFromSuperview()
    }
    
    func configCell() {
        configText()
    }
    
    private func configText() {
        contentView.addSubview(timeLabel)
        contentView.addSubview(iconWeather)
        contentView.addSubview(tempLabel)
        timeLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(iconWeather.snp.top).offset(-10)
        }
        iconWeather.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(25)
            make.height.equalTo(20)
        }
        tempLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(iconWeather.snp.bottom).offset(10)
        }
    }
}
