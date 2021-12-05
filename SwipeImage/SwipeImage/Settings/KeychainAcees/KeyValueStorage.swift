//
//  keyValueStorage.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 5.12.21.
//

import Foundation

protocol KeyValueStorage {
    
    func getValueString(key:String) -> String?
    
    func getValue(key:String) -> Data?
    
    func setValueString(key:String,value: String)
    
    func setValue(key:String,value: Data)
    
    func clear()
    
}
