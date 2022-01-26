//
//  SharedStorageImp.swift
//  Weather_Viper
//
//  Created by Dima on 26.01.22.
//
import Foundation
final class SharedStorageImp: SharedStorage {
    let storage = UserDefaults.standard
    
    func setValue(key: String, value: Data?) {
        storage.set(value, forKey: key)
    }
    
    func getValue(key: String) -> Data {
        return storage.data(forKey: key) ?? Data()
    }
}
