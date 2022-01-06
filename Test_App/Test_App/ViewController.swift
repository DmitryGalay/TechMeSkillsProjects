//
//  ViewController.swift
//  Test_App
//
//  Created by Dima on 6.01.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let view1: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        //view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        view.addSubview(view1)
        createFirstView()
        setupView()
        viewSettings()
    }
    
    func createFirstView() {
        if let myFirstView = Bundle.main.loadNibNamed("LocationView", owner: self, options: nil)?.first as? LocationView {
            view1.addSubview(myFirstView)
            myFirstView.backgroundColor = .green
            myFirstView.roundCorners(corners: [.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 25)
            myFirstView.snp.makeConstraints { make in
                //                make.size.equalTo(CGSize(width: view.frame.width * 0.9 , height: view.frame.height * 0.9 ))
                make.top.equalTo(view1).offset(15)
                make.bottom.equalTo(view1).offset(-15)
                make.left.equalTo(view1).offset(15)
                make.right.equalTo(view1).offset(15)
                make.centerX.equalTo(view.snp.centerX)
            }
            myFirstView.createLabel(text: "Hello")
            myFirstView.locationName.snp.makeConstraints { make in
                make.top.equalTo(myFirstView).offset(20)
                make.left.equalTo(myFirstView).offset(20)
            }
            myFirstView.createAddPhoto()
            myFirstView.addPhoto.snp.makeConstraints { make in
                make.size.equalTo(CGSize(width: 50, height: 50))
                make.top.equalTo(myFirstView).offset(20)
                make.right.equalTo(myFirstView).offset(-20)
            }
            myFirstView.createCollection()
            myFirstView.collectionView.snp.makeConstraints { make in
                make.bottom.equalTo(myFirstView).offset(-20)
                make.top.equalTo(myFirstView.locationName.snp.bottom).offset(20)
                make.right.equalTo(myFirstView).offset(-20)
                //make.left.equalTo(myFirstView).offset(-20)
                make.centerX.equalTo(myFirstView.snp.centerX)
            }
//            myFirstView.ffff()
            myFirstView.createImage()
            myFirstView.awakeFromNib()
            
            
            
        }
    }
    
    
    func setupView() {
        view1.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: view.frame.width , height: view.frame.height / 2.5 ))
            make.top.equalTo(view).offset(view.frame.height / 5)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    func viewSettings() {
        view1.roundCorners(corners: [.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 25)
        view1.addShadow()
    }
}

