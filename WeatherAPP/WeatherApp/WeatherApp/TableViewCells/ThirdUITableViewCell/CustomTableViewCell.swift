//
//  CustomTableViewCell.swift
//  WeatherApp
//
//  Created by Dima on 22.11.21.
//

import Foundation
import UIKit

class CustomTableViewCell:UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var slashLabel: UILabel!
    @IBOutlet  weak var mainImageView: UIImageView!
    @IBOutlet weak var tempMaxLabel: UILabel!
    
    override var reuseIdentifier: String? {
        return "CustomTableViewCell"
    }
}
