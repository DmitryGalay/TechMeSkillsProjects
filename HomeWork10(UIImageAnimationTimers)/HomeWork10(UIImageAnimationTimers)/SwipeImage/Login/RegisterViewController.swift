//
//  RegisterViewController.swift
//  CashBack
//
//  Created by Dima on 6/29/21.
//

import UIKit

struct UserForm : Codable{
    var email: String
    var password: String
    var name: String
}

enum RegisterError: LocalizedError {
    case emailNotValid
    case passwordNotValid
    case nameNotValid
    
    var errorDescription: String? {
        switch self {
        case .emailNotValid:
            return "Email not valid"
        case .passwordNotValid:
            return "Password not valid"
        case .nameNotValid:
            return "Name not valid"
        }
    }
}

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var registerNameTextField: UITextField!
    @IBOutlet weak var registerEmailTextfield: UITextField!
    @IBOutlet weak var securityPasswordOutlet: UIButton!
    @IBOutlet weak var registerPasswordTextField: UITextField!
    private let minLength = 6
    private let password = "а132$А132"
    private lazy var regex = "^(?=.*[а-я])(?=.*[А-Я])(?=.*\\d)(?=.*[$@$!%*?&#])[А-Яа-я\\d$@$!%*?&#]{\(minLength),}$"
    override func viewDidLoad() {
        super.viewDidLoad()
        registerPasswordTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        registerNameTextField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        registerNameTextField.delegate = self
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 2
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func checkEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func checkValidation(password: String) {
        guard password.count >= minLength else {
            messageLabel.text = ""
            return
        }
        if password.matches(regex) {
            messageLabel.textColor = .green
            messageLabel.text = "Верные символы в пароле!"
        } else {
            messageLabel.textColor = .black
            messageLabel.text = "Минимум \(minLength) символов.Должен содержать: Большую букву,маленькую букву, цифру и специальный символ"
        }
    }
    
    func addToDefaults() {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        let user = UserForm(email: registerEmailTextfield.text!, password: registerPasswordTextField.text!, name: "")
        if let data = try? encoder.encode(user) {
            defaults.set(data, forKey: registerEmailTextfield.text!)
        }
    }
    
    func readFromDefaults() {
        let defaults = UserDefaults.standard
        if let userData = defaults.value(forKey: registerEmailTextfield.text!) as? Data {
            let decoder = JSONDecoder()
            let user = try? decoder.decode(UserForm.self, from: userData)
            
        }
    }
    
    
    func alertEmailMessage(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) {
            action in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    func alertSaveMessage(message: String) {
        let alert = UIAlertController(title: "Save", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) {
            action in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func toggleSecureEntry(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        registerPasswordTextField.isSecureTextEntry = !sender.isSelected
    }
    
    @IBAction func creatAccountButton(_ sender: UIButton) {
        addToDefaults()
        readFromDefaults()
        alertSaveMessage(message: "")
    }
    
    @IBAction func signInButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func userForm() throws -> UserForm {
        guard let email = registerEmailTextfield.text else {
            throw RegisterError.emailNotValid
        }
        guard checkEmail(email: email) else {
            throw RegisterError.emailNotValid
        }
        guard let password = registerPasswordTextField.text, password.count > 6 else {
            throw RegisterError.passwordNotValid
        }
        guard let name = registerNameTextField.text, name.count > 3 else {
            throw RegisterError.nameNotValid
        }
        return UserForm(email: email, password: password, name: name)
    }
    
    @IBAction func exitAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension UIView {
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height ,
                              width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text ?? "") + string
        let res: String
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            res = String(text[text.startIndex..<end])
        } else {
            res = text
        }
        checkValidation(password: res)
        textField.text = res
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let isSuccess = (textField.text == password)
        messageLabel.textColor = isSuccess ? .green : .red
        messageLabel.text = isSuccess ? "Success" : "Error"
        textField.resignFirstResponder()
        return true
    }
}

extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
