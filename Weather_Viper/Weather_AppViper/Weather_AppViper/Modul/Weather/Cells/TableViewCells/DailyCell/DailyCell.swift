//
//  DailyCell.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//
   
import Foundation
import UIKit
import SnapKit

class DailyCell: UITableViewCell {
    
    
    static let indetifier = "DailyCell"
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    var dayOfWeekLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    var minTempLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    var maxTempLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    var slashLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    var iconImageView: UIImageView = {
       let icon = UIImageView()
        icon.tintColor = .white
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }
    
    private func config() {
        configСontainerView()
        configTimeLabel()
        configTemp()
        createWeatherIcon()
       
    }
    
    private func configСontainerView() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        containerView.backgroundColor = .black
    }
    
    private func configTimeLabel() {
        containerView.addSubview(dayOfWeekLabel)
        dayOfWeekLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        dayOfWeekLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalTo(containerView.snp.centerY)
        }
    }
    private func createWeatherIcon() {
        containerView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.centerY.equalTo(containerView.snp.centerY)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
            
    }
    
    private func configTemp() {
        containerView.addSubview(minTempLabel)
        containerView.addSubview(maxTempLabel)
        containerView.addSubview(slashLabel)
        minTempLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        maxTempLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        
        maxTempLabel.snp.makeConstraints { make in
            make.centerY.equalTo(containerView.snp.centerY)
            make.right.equalToSuperview().offset(-70)
        }
        
        slashLabel.snp.makeConstraints { make in
            make.centerY.equalTo(containerView.snp.centerY)
            make.right.equalToSuperview().offset(-50)
        }
        
        minTempLabel.snp.makeConstraints { make in
            make.centerY.equalTo(containerView.snp.centerY)
            make.right.equalToSuperview().offset(-10)
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "DailyCell", bundle: nil)
    }

    
}
    


