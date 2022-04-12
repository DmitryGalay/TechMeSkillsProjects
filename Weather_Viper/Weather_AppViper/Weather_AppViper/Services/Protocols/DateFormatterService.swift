//
//  DateFormatterService.swift
//  Weather_Viper
//
//  Created by Dima on 26.01.22.
//

import Foundation

protocol DateFormatterService {
    func dateFormater(dt: Float, format: String) -> String
}
