//
//  ExtensionCorner.swift
//  UILayoutSnapKit
//
//  Created by Dima on 29.11.21.
//

import Foundation
import UIKit
extension UIView {

    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
        }
    }
    
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
           layer.masksToBounds = false
           layer.shadowOffset = offset
           layer.shadowColor = color.cgColor
           layer.shadowRadius = radius
           layer.shadowOpacity = opacity

           let backgroundCGColor = backgroundColor?.cgColor
           backgroundColor = nil
           layer.backgroundColor =  backgroundCGColor
       }
//    func addShadow() {
//        
//       
//       
//        layer.shadowOffset = CGSize(width: 0, height: 3)
//        layer.shadowOpacity = 0.7
//        layer.shadowRadius = 7.0
////        layer.masksToBounds = false
//        layer.shadowColor = UIColor.black.cgColor
////        layer.shadowOpacity = 1
////        layer.shadowOffset = CGSize(width: 0 , height: 15)
////        layer.shadowRadius = 20
//        layer.shouldRasterize = true
////        layer.rasterizationScale = UIScreen.main.scale
//    }
}
