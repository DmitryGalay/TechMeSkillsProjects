//
//  SecondUITableViewCell.swift
//  WeatherApp
//
//  Created by Dima on 22.11.21.
//

import Foundation
import UIKit

class SecondUITableViewCell: UITableViewCell {
    
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var degLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    
    override var reuseIdentifier: String? {
        return "SecondUITableViewCell"
    }
}
