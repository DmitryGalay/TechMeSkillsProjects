//
//  ExtensionAlert.swift
//  HomeWork11(AttributedStrings)
//
//  Created by Dima on 18.10.21.
//

import Foundation
import UIKit
var delegate: SwipeImageDelegate?

extension UIViewController {
    func alertWithTwoButtons(withTitle title: String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [weak alertController, weak self] (_) in
            let message = "Have a nice day!"
            let innerAlert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            innerAlert.addAction(UIAlertAction(title: "OK", style: .default,
                                               handler:{ [weak alertController, weak self] (_) in
                                                self?.dismiss(animated: true)}
            ))
            self?.present(innerAlert, animated: true, completion: nil)
        }))
        alertController.addAction(UIAlertAction(title: "No", style: .destructive, handler: { [weak alertController, weak self] (_) in
            let message = "Good!"
            let innerAlert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            innerAlert.addAction(UIAlertAction(title: "OK", style: .default,
                                               handler:{ [weak alertController, weak self] (_) in
                                                delegate?.checkBlur(isBlur: false)
                                               }
            ))
            self?.present(innerAlert, animated: true, completion:{ delegate?.checkBlur(isBlur: false)})
        }
        ))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertWithPassword(withTitle title: String, message : String, textValue:String) {
        //let textValue = textValue
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: { [self]
            textField in
            textField.placeholder = "Enter the password"
            textField.text = textValue
            textField.isSecureTextEntry.toggle()
            textField.enablePasswordToggle()
            textField.addTarget(self, action: #selector(editor), for: UIControl.Event.editingChanged)
            
        })
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alertController, weak self] (_) in
            delegate?.getImage()
            
        }))
        alertController.addAction(UIAlertAction(title: "Cansel", style: .destructive, handler: { [weak alertController, weak self] (_) in
            let message = "Good!"
            let innerAlert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            innerAlert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
            self?.present(innerAlert, animated: true, completion:{ delegate?.checkBlur(isBlur: false)})
        }
        ))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func checkPassword(textField: UITextField) {
        
        if textField.text == "123" {
            delegate?.getImage()
        }
    }
    
    @objc func editor(textfield: UITextField) {
        print(textfield.text as Any)
    }
    
    func alertMain(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) {
            action in
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
