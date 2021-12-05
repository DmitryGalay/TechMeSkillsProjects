//
//  Alert.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 25.10.21.
//

import Foundation
import UIKit

class Alert: UIView {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var exit: UIButton!
    @IBOutlet weak var YesButton: UIButton!
    @IBOutlet weak var comments: UITextView!
    @IBOutlet weak var customOutlet: UILabel!
    func setTitle(title:String,exitTitle:String,yesTitle:String) {
        customOutlet.text = title
        exit.setTitle(exitTitle, for: .normal)
        YesButton.setTitle(yesTitle, for: .normal)
    }
}
