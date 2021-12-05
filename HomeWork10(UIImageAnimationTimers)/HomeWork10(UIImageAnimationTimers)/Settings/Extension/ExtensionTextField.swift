//
//  ExtensionTextField.swift
//  HomeWork11(AttributedStrings)
//
//  Created by Dima on 13.10.21.
//
import Foundation
import UIKit
let button = UIButton(type: .custom)
extension UITextField {
    
    func checkValid() {
        
    }
    func settingTextField() {
        adjustsFontSizeToFitWidth = true
        font = UIFont.systemFont(ofSize: 25)
        minimumFontSize = 11
        clearButtonMode = .whileEditing
        clearButtonMode = .unlessEditing
        clearButtonMode = .always
        becomeFirstResponder()
        textColor = UIColor.lightGray
    }
    
    func setGradientBackgroundText() {
        let colorTop =  #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1).cgColor
        let colorBottom = #colorLiteral(red: 0.5808190107, green: 0.0884276256, blue: 0.3186392188, alpha: 1).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = frame.height / 2
        gradientLayer.borderWidth = 2
        gradientLayer.borderColor = UIColor.systemOrange.cgColor
        layer.insertSublayer(gradientLayer, at:0)
    }
    
    func placeholderColor(color: UIColor) {
        let attributeString = [
            NSAttributedString.Key.foregroundColor: color.withAlphaComponent(0.6),
            NSAttributedString.Key.font: self.font!
        ] as [NSAttributedString.Key : Any]
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: attributeString)
    }
    
    func enablePasswordToggle(){
        button.setImage(UIImage(named: "open"), for: .normal)
        button.setImage(UIImage(named: "close"), for: .selected)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = button
        rightViewMode = .always
        button.alpha = 0.4
    }
    
    @objc func togglePasswordView(_ sender: Any) {
        isSecureTextEntry.toggle()
        button.isSelected.toggle()
    }}

