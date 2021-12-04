//
//  MainView.swift
//  WeatherApp
//
//  Created by Dima on 21.11.21.
//

import Foundation
import UIKit

class MainView: UIView {
    var tableView = UITableView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.firstInitialization()
        setupConst()
    }
    
    private func firstInitialization() {
        self.addSubview(tableView)
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        self.tableView.register(UINib(nibName: "FirstUITableViewCell", bundle: nil), forCellReuseIdentifier: "FirstUITableViewCell")
        self.tableView.register(UINib(nibName: "SecondUITableViewCell", bundle: nil), forCellReuseIdentifier: "SecondUITableViewCell")
    }
    
    private func setupConst() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
