//
//  ExtensionTextField.swift
//
import Foundation
import UIKit

extension UITextField {
    
    func settingTextField() {
        adjustsFontSizeToFitWidth = true
        font = UIFont.systemFont(ofSize: 25)
        minimumFontSize = 11
        clearButtonMode = .whileEditing
        clearButtonMode = .unlessEditing
//        clearButtonMode = .always
        becomeFirstResponder()
        textColor = UIColor.lightGray
    }
}
