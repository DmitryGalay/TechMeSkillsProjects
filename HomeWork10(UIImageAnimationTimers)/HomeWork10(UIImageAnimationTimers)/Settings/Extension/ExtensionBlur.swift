//
//  ExtensionBlur.swift
//  HomeWork11(AttributedStrings)
//
//  Created by Dima on 18.10.21.
//

import Foundation
import UIKit

extension UIView {
    
    func createBlur() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.tag = 2
        insertSubview(blurEffectView, at: 4)
    }
    
    func delBlur() {
        viewWithTag(2)?.removeFromSuperview()
    }
}
