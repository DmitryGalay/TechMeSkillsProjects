//
//  ViewController.swift
//  CashBack
//
//  Created by Artyom Lihach on 29.06.21.
//

import UIKit
struct Keys {
    static let userKey = "kUser"
    
}

struct User: Codable{
    let email: String
    let password: String
}

class LoginViewController: UIViewController,UITextFieldDelegate , UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var addImage: UIButton!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginOutlet: UIButton!
    @IBOutlet weak var passwordStack: UIStackView!
    @IBOutlet weak var loginStack: UIStackView!
    @IBOutlet weak var loginsecurityEyeOutlet: UIButton!
    var gameDelegate: SwipeImageDelegate?
    var isFiledName: Bool = false
    var isFiledPassword: Bool = false
    
    override func viewDidLayoutSubviews() {
        mainImageView.layer.cornerRadius = mainImageView.layer.bounds.width/2
        mainImageView.clipsToBounds = true
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        userNameTextField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        userNameTextField.delegate = self
        passwordTextField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        passwordTextField.delegate = self
        userNameTextField.addTarget(self, action: #selector(LoginViewController.userCheck(textField:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(LoginViewController.passwordCheck(textField:)), for: .editingChanged)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainImageView.image = UIImage(named: "icon\(Options.shared.imageName)")
            ?? UIImage(named: "logoUserName")
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
    
    @IBAction func checkButton(_ sender: UIButton) {
        checkValueButton()
        guard let email = userNameTextField.text else {
            return
        }
        guard checkEmail(email: email) else {
            return
        }
        guard let userPassword = passwordTextField.text, userPassword.count > 0 else {
            return
        }
    }
    
    @objc func userCheck(textField: UITextField) {
        let defaults = UserDefaults.standard
        if let userData = defaults.value(forKey: userNameTextField.text!) as? Data {
            let decoder = JSONDecoder()
            let user = try? decoder.decode(UserForm.self, from: userData)
            if user!.email == userNameTextField.text {
                loginStack.addBottomBorderWithColor(color: .green, width: 3)
                print("Yes")
                isFiledName = true
            }else {
                print("No")
            }
        }
    }
    
    @objc func passwordCheck(textField: UITextField) {
        let defaults = UserDefaults.standard
        if let userData = defaults.value(forKey: userNameTextField.text!) as? Data {
            let decoder = JSONDecoder()
            let user = try? decoder.decode(UserForm.self, from: userData)
            if user!.password == passwordTextField.text {
                passwordStack.addBottomBorderWithColor(color: .green, width: 3)
                loginOutlet.isEnabled = true
                print("Yes")
                isFiledPassword = true
            }else {
                print("No")
            }
        }
    }
    
    func checkValueButton() {
        if isFiledName && isFiledPassword {
            //self.dismiss(animated: true)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controler = storyboard.instantiateViewController(identifier: "MyViewController")
            controler.modalPresentationStyle = .overFullScreen
           present(controler, animated: true)
        }else if !isFiledName && isFiledPassword {
            loginStack.shake()
            loginStack.addBottomBorderWithColor(color: .red, width: 3)
            //alertMain(message: "", title: "Enter the name")
        }else if isFiledName && !isFiledPassword {
            passwordStack.shake()
            passwordStack.addBottomBorderWithColor(color: .red, width: 3)
            //alertMain(message: "", title: "Enter the password")
        }else {
            loginStack.shake()
            passwordStack.shake()
            loginStack.addBottomBorderWithColor(color: .red, width: 3)
            passwordStack.addBottomBorderWithColor(color: .red, width: 3)
            //alertMain(message: "", title: "Enter the data")
        }
    }
    
    func alertEmailMessage(message: String) {
        let alert = UIAlertController(title: "Save", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) {
            action in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {return}
        mainImageView.image = image
        dismiss(animated: true)
    }
    
    @IBAction func didTapAddAction(_ sender: Any) {
        openAlbum()
//        let piker = UIImagePickerController()
//        piker.allowsEditing = true
//        piker.sourceType = .photoLibrary
//        piker.delegate = self
//        present(piker, animated: true)
    }
    
    @IBAction func didTapRegisterButtom(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let RegVC = storyboard.instantiateViewController(withIdentifier: String(describing: RegisterViewController.classForCoder())) as? RegisterViewController {
            RegVC.modalPresentationStyle = .overCurrentContext
            present(RegVC, animated: true, completion: nil)
        }
    }
    
        func openAlbum() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controler = storyboard.instantiateViewController(identifier: "PhotoViewController")
            controler.modalPresentationStyle = .fullScreen
           present(controler, animated: true)
        }
    
    func readFromDefaults() {
        let defaults = UserDefaults.standard
        if let userData = defaults.value(forKey: userNameTextField.text!) as? Data {
            let decoder = JSONDecoder()
            let user = try? decoder.decode(User.self, from: userData)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
              let rangeOfTextToReplace = Range(range, in: textFieldText) else {
            return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 20
    }
    
    func alertMessage(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) {
            action in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func loginSecurityAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordTextField.isSecureTextEntry = !sender.isSelected
    }
    
    @IBAction func exitAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension UserDefaults {
    func contains(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
}
