//
//  MainInfoView.swift
//  UILayoutSnapKit
//
//  Created by Dima on 27.11.21.
//

import Foundation
import UIKit
import Rswift
import SnapKit

class MainInfoView: UIView {
    
    @IBOutlet weak var customLabel: UILabel!
    @IBOutlet weak var customTextField: UITextField!
    @IBOutlet weak var customButton: UIButton!
    
    func createLabel(text: String) {
       
        customLabel.setText(text, withColorPart: "", color: .red)
        customLabel.backgroundColor = .white
        customLabel.textColor = .lightGray
        customLabel.textAlignment = .center
        }
        
    
    func createTextFiled() {
        customTextField.backgroundColor = .white
        customTextField.settingTextField(ofSize: 20)
        
        customTextField.addTarget(self, action: #selector(checkTextField), for: .editingChanged)
    }
      @objc  func checkTextField() {
            if customTextField.text!.count > 1 {
                if customTextField.tag == 1 {
                customButton.isHidden = false
            }
            }
    }

    func createImage() {
        customButton.isHidden = true
        customButton.backgroundColor = .white
        customButton.setImage(UIImage(systemName: "xmark" ), for: .normal)
        customButton.tintColor = .black
        customButton.addTarget(self, action: #selector(delTextFieldText), for: .touchUpInside)
        
        
    }
    
    @objc func delTextFieldText() {
        customTextField.text = ""
    }
    
    func createEye() {
        customButton.backgroundColor = .white
        customButton.setImage(UIImage(named: "eyeOn"), for: .normal)
        customButton.setImage(UIImage(named: "eyeOff"), for: .selected)
       
    customButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
}
    
    @objc func togglePasswordView(_ sender: Any) {
        
        customTextField.isSecureTextEntry.toggle()
        customButton.isSelected.toggle()
        customButton.backgroundColor = .white
    }
    
   
}
extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        self.clipsToBounds = true  // add this to maintain corner radius
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.setBackgroundImage(colorImage, for: forState)
        }
    }
}
