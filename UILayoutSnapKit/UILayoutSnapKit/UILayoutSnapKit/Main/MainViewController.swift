//
//  MainViewController.swift
//  UILayoutSnapKit
//
//  Created by Dima on 27.11.21.
//
import SnapKit
import UIKit
import Rswift


class MainViewController: UIViewController ,UINavigationControllerDelegate,UITextFieldDelegate{
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var loginLabelOutlet: UILabel!
    @IBOutlet weak var trailerLabelOutlet: UILabel!
    @IBOutlet weak var faceID: UIButton!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        view.layer.cornerRadius = 25
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        createImage(viewWidth: view.frame.width, viewHeight: view.frame.height)
        createLoginLabel(size: 25, offset: 50)
        createTrailerLabel(size: 15, offset: 5)
        createFirstView()
        createSecondView()
        createThirdView()
        addImageFaceIDButton()
        addImageLoginButton()
       

    }
    
    func createFirstView() {
        if let myFirstView = Bundle.main.loadNibNamed("MainInfoView", owner: self, options: nil)?.first as? MainInfoView {
            
            firstView.addSubview(myFirstView)
            myFirstView.createLabel(text: "User name")
            myFirstView.createImage()
            myFirstView.customTextField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
            myFirstView.customTextField.delegate = self
            myFirstView.customTextField.tag = 1
            myFirstView.createTextFiled()
            myFirstView.layer.cornerRadius = 15
            myFirstView.snp.makeConstraints { make in
                make.size.equalTo(CGSize(width: view.frame.width / 1.2, height: view.frame.height / 15 ))
            }
        }
    }
    
    func createSecondView() {
        if let mySecondView = Bundle.main.loadNibNamed("MainInfoView", owner: self, options: nil)?.first as? MainInfoView {
            secondView.addSubview(mySecondView)
            mySecondView.customTextField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
            mySecondView.customTextField.delegate = self
            mySecondView.createLabel(text: "Organization")
            mySecondView.customButton.isHidden = true
            mySecondView.createTextFiled()
            mySecondView.layer.cornerRadius = 15
            mySecondView.snp.makeConstraints { make in
            
                make.size.equalTo(CGSize(width: view.frame.width / 1.2, height: view.frame.height / 15 ))
            }
        }
    }
    
    func createThirdView() {
        if let myThirdView = Bundle.main.loadNibNamed("MainInfoView", owner: self, options: nil)?.first as? MainInfoView {
            thirdView.addSubview(myThirdView)
            myThirdView.customTextField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
            myThirdView.customTextField.delegate = self
            myThirdView.createLabel(text: "Password")
            myThirdView.createTextFiled()
            myThirdView.customButton.isHighlighted = true
            myThirdView.layer.cornerRadius = 15
            myThirdView.createEye()
            myThirdView.snp.makeConstraints { make in
                make.size.equalTo(CGSize(width: view.frame.width / 1.2, height: view.frame.height / 15 ))
            }
        }
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
    
    
    func createImage(viewWidth: CGFloat,viewHeight: CGFloat) {
        imageOutlet.image = R.image.elephant()
        imageOutlet.backgroundColor = .white
        imageOutlet.layer.cornerRadius = 15
        imageOutlet.snp.makeConstraints { make in
            make.width.equalTo(viewWidth / 5)
            make.height.equalTo(viewWidth / 5)
            make.centerY.equalTo(viewHeight / 5)
            make.centerX.equalTo(viewWidth / 2)
        }
    }
    
    func createLoginLabel(size: CGFloat, offset: Int) {
      
        loginLabelOutlet.setText("Login to beUpToDate", withColorPart: "beUpToDate", color: .systemBlue)
        loginLabelOutlet.textAlignment = .center
        loginLabelOutlet.font = loginLabelOutlet.font.with(traits: [.traitBold,.traitCondensed]).withSize(size)
        loginLabelOutlet.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: view.frame.width / 1.5, height: size * 1.5))
            make.top.equalTo(imageOutlet.snp_bottomMargin).offset(offset)
            make.centerX.equalTo(imageOutlet)
        }
    }
    
    func createTrailerLabel(size: CGFloat,offset: Int) {
        trailerLabelOutlet.setText("Trailer info at a glance", withColorPart: "", color: .systemBlue)
        trailerLabelOutlet.textAlignment = .center
        trailerLabelOutlet.font = trailerLabelOutlet.font.with(traits: .traitCondensed).withSize(size)
        trailerLabelOutlet.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: view.frame.width / 1.5, height: size * 1.5))
            make.top.equalTo(loginLabelOutlet.snp_bottomMargin).offset(offset)
            make.centerX.equalTo(imageOutlet)
        }
    }
    
    func addImageFaceIDButton() {
        faceID.layer.cornerRadius = 15
        //faceID.titleLabel?.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
        faceID.titleLabel?.font = UIFont(name:"Times New Roman", size: 120)
        faceID.setImage(UIImage(systemName: "faceid"), for: .normal)
        faceID.setTitle(" Face ID", for: .normal)
        faceID.layer.borderWidth = 2
       
        
    }
    
    func addImageLoginButton() {
        login.layer.cornerRadius = 15
        login.setTitle("Login", for: .normal)
        login.backgroundColor = .black
    }
    
    @IBAction func didTapActionSeconVC(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let RegVC = storyboard.instantiateViewController(withIdentifier: String(describing: SecondViewController.classForCoder())) as? SecondViewController {
            RegVC.modalPresentationStyle = .automatic
            present(RegVC, animated: true, completion: nil)
        }
    }
}
