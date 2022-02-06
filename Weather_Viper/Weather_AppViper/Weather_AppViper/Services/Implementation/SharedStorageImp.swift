//
//  SharedStorageImp.swift
//  Weather_Viper
//
//  Created by Dima on 26.01.22.
//
import Foundation
final class SharedStorageImp: SharedStorage {
    static let shared = SharedStorageImp()
    
    func setValue(key: String, value: Data?) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func getValue(key: String) -> Data {
        return UserDefaults.standard.data(forKey: key) ?? Data()
    }
}
