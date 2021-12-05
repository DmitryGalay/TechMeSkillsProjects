//
//  ProtectedStorage.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 5.12.21.
//

import KeychainAccess

final class ProtectedStorage: KeyValueStorage {
    
    let storage = Keychain().accessibility(.whenUnlocked)
    
    func getValueString(key: String) -> String? {
        return try? storage.get(key)
    }
    
    func getValue(key: String) -> Data? {
        return try? storage.getData(key)
    }
    
    func setValueString(key: String, value: String) {
        try? storage.set(value, key: key)
    }
    
    func setValue(key: String, value: Data) {
        try? storage.set(value, key: key)
    }
    
    func clear() {
        try? storage.removeAll()
    }
    
}
