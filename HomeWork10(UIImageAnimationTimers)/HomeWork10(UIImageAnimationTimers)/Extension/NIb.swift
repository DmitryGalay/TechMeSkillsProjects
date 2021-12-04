//
//  NIb.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 25.10.21.
//
import Foundation
import UIKit

extension UIView {
    class func loadfronNIB<T:UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
