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



//    func addToDefaults() {
//        let defaults = UserDefaults.standard
//        let encoder = JSONEncoder()
//        let coments = Comments(commentText: alert.comments.text!)
//        if let data = try? encoder.encode(coments.commentText) {
//            defaults.set(data, forKey: "\(String(describing: mainImageView.image))")
//        }
//    }

//    func readFromDefaults() {
//        let defaults = UserDefaults.standard
//        if let userData = defaults.value(forKey: (String(describing: mainImageView.image))) as? Data {
//            let decoder = JSONDecoder()
//            let user = try? decoder.decode(Comments.self, from: userData)
//            print(user)
//        }
//    }
