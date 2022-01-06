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
    
    func addShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 15 , height: 15)
        layer.shadowRadius = 20
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
