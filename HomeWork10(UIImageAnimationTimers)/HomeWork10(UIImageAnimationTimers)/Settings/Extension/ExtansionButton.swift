//
//  Extansio+Button.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 11.10.21.
//

import Foundation
import UIKit

extension UIView {
    
    func addShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 15 , height: 15)
        layer.shadowRadius = 20
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func addRadius(amount: CGFloat, withBorderAmount borderWidthAmount: CGFloat, andColor borderColor: UIColor) {
                clipsToBounds = true
            self.layer.cornerRadius = amount
            self.layer.borderWidth = borderWidthAmount
            self.layer.borderColor = borderColor.cgColor
            self.layer.masksToBounds = true

        }
    
    func addGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.cornerRadius = frame.height / 2
        gradient.borderWidth = 2
        gradient.borderColor = UIColor.systemOrange.cgColor
        gradient.colors = [UIColor.systemGreen.cgColor, UIColor.systemOrange.cgColor]
        layer.insertSublayer(gradient, at: 0)
    }
}
