//
//  ViewController.swift
//  Test_App
//
//  Created by Dima on 6.01.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let mainView: UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "viewColor")
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        view.addSubview(mainView)
        createFirstView()
        setupView()
    }
    
    func setupView() {
        mainView.roundCorners(corners: [.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 25)
        mainView.addShadow(offset: CGSize.init(width: 0, height: 7), color: UIColor.lightGray, radius: 5.0, opacity: 0.8)
        mainView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: view.frame.width , height: view.frame.height / 2.5 ))
            make.top.equalTo(view).offset(view.frame.height / 5)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    func createFirstView() {
        if let myFirstView = Bundle.main.loadNibNamed("LocationView", owner: self, options: nil)?.first as? LocationView {
            mainView.addSubview(myFirstView)
            myFirstView.backgroundColor = UIColor(named: "myFirstViewColor")
            myFirstView.roundCorners(corners: [.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 25)
            myFirstView.snp.makeConstraints { make in
                make.top.equalTo(mainView).offset(15)
                make.bottom.equalTo(mainView).offset(-15)
                make.left.equalTo(mainView).offset(15)
                make.right.equalTo(mainView).offset(15)
                make.centerX.equalTo(view.snp.centerX)
            }
            myFirstView.createLabel()
            myFirstView.locationName.snp.makeConstraints { make in
                make.top.equalTo(myFirstView).offset(20)
                make.left.equalTo(myFirstView).offset(20)
                make.right.equalTo(myFirstView.addPhoto.snp.right).offset(-70)
                
            }
            myFirstView.createAddPhoto()
            myFirstView.addPhoto.snp.makeConstraints { make in
                make.size.equalTo(CGSize(width: 50, height: 50))
                make.top.equalTo(myFirstView).offset(15)
                make.right.equalTo(myFirstView).offset(-15)
            }
            myFirstView.createCollection()
            myFirstView.collectionView.snp.makeConstraints { make in
                make.bottom.equalTo(myFirstView).offset(-20)
                make.top.equalTo(myFirstView.locationName.snp.bottom).offset(20)
                make.right.equalTo(myFirstView).offset(-20)
                make.centerX.equalTo(myFirstView.snp.centerX)
            }
            myFirstView.createImage()
            myFirstView.awakeFromNib()
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
}
