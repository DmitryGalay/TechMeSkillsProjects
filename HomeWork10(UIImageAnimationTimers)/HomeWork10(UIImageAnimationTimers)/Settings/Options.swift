//
//  Options.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 8.11.21.
//

import Foundation

struct OptionsKey {
    static let imageName = "kImageName"
    
}

class Options {
    static let shared = Options()
    
 
    var imageName: Int {
        set {
            UserDefaults.standard.set(newValue, forKey: OptionsKey.imageName)
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.integer(forKey: OptionsKey.imageName)
        }
    }
}

