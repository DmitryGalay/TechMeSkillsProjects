//
//  SharedStorage.swift
//  Weather_Viper
//
//  Created by Dima on 26.01.22.
//

import Foundation

protocol SharedStorage {
    func setValue(key: String, value: Data?)
    
    func getValue(key: String) -> Data
}
