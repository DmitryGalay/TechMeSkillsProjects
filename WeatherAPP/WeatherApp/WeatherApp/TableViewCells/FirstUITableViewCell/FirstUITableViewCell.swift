//
//  FirstUITableViewCell.swift
//  WeatherApp
//
//  Created by Dima on 22.11.21.
//

import Foundation
import UIKit

class FirstUITableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainTempImageView: UIImageView!
    @IBOutlet weak var mainTempLabel: UILabel!
    @IBOutlet weak var descrLabel: UILabel!
    @IBOutlet weak var feelsLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override var reuseIdentifier: String? {
        return "FirstUITableViewCell"
    }
}
