//
//  SecondViewController.swift
//  UILayoutSnapKit
//
//  Created by Dima on 28.11.21.
//

import SnapKit
import UIKit
import Rswift


class SecondViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var addImage: UIButton!
    @IBOutlet weak var loginOff: UIButton!
    @IBOutlet weak var loginOffView: UIView!
    @IBOutlet weak var firstDetailView: UIView!
    @IBOutlet weak var secondDetailView: UIView!
    @IBOutlet weak var thirdDetailView: UIView!
    @IBOutlet weak var fourthDetailView: UIView!
    @IBOutlet weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        stackView.roundCorners(corners: [.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 25)
        createLogOutButton()
        createLabel()
        createImage()
        creatFirstDetailView()
        creatSecondDetailView()
        creatThirdDetailView()
        creatFourthDetailView()
        
        
    }
    
    
    func createLogOutButton() {
        loginOffView.backgroundColor = .white
        loginOffView.layer.masksToBounds = true
        loginOffView.layer.cornerRadius = 50
        loginOff.layer.cornerRadius = 20
        loginOff.layer.borderWidth = 1.5
        loginOff.backgroundColor = .white
        loginOff.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
    }
    
    func createLabel() {
        nameLabel.setText("Heiden Biermann", withColorPart: "", color: .systemBlue)
        typeLabel.setText("Type to edit", withColorPart: "", color: .systemBlue)
        nameLabel.textAlignment = .center
        typeLabel.textAlignment = .center
        nameLabel.font = nameLabel.font.with(traits: [.traitBold,.traitCondensed]).withSize(20)
        typeLabel.font = typeLabel.font.with(traits: .traitCondensed).withSize(12
        )
    }
    func createImage() {
        
        viewImage.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        photoImage.layer.cornerRadius = 50
        addImage.backgroundColor = .black
        addImage.setImage(UIImage(systemName: "plus"), for: .normal)
        addImage.layer.cornerRadius = 10
        //photoImage.image = R.image.elephant
    }
    
    func creatFirstDetailView() {
        if let myFirstDetailView = Bundle.main.loadNibNamed("SecondView", owner: self, options: nil)?.first as? SecondView {
            firstDetailView.addSubview(myFirstDetailView)
            //firstDetailView.roundCorners(corners: [.topLeft,.topRight] ,radius: 20)
            myFirstDetailView.detailImage.tag = 1
            myFirstDetailView.createdetailImage()
            myFirstDetailView.createdetailButton()
            myFirstDetailView.createfirstDetailLabel(text: "Login details", size: 17)
            myFirstDetailView.createsecondDetailLabel(text: "User name,Password", size: 11)
            myFirstDetailView.snp.makeConstraints { make in
//                make.size.equalTo(CGSize(width: view.frame.width / 1.1, height: view.frame.height / 9 ))
            }
        }
    }
    func creatSecondDetailView() {
        if let mySecondDetailView = Bundle.main.loadNibNamed("SecondView", owner: self, options: nil)?.first as? SecondView {
            secondDetailView.addSubview(mySecondDetailView)
            mySecondDetailView.detailImage.tag = 2
            mySecondDetailView.createdetailImage()
            mySecondDetailView.createdetailButton()
            mySecondDetailView.createfirstDetailLabel(text: "Help", size: 17)
            mySecondDetailView.createsecondDetailLabel(text: "FAQs,Helpdesk", size: 11)
            mySecondDetailView.snp.makeConstraints { make in
//                make.size.equalTo(CGSize(width: view.frame.width / 1.1, height: view.frame.height / 9 ))
            }
        }
    }
    func creatThirdDetailView() {
        if let myThirdDetailView = Bundle.main.loadNibNamed("SecondView", owner: self, options: nil)?.first as? SecondView {
            thirdDetailView.addSubview(myThirdDetailView)
            myThirdDetailView.detailImage.tag = 3
            myThirdDetailView.createdetailImage()
            myThirdDetailView.createdetailButton()
            myThirdDetailView.createfirstDetailLabel(text: "Legal information", size: 17)
            myThirdDetailView.createsecondDetailLabel(text: "Terms & Conditions,Privacy Policy", size: 11)
            myThirdDetailView.snp.makeConstraints { make in
//                make.size.equalTo(CGSize(width: view.frame.width / 1.1, height: view.frame.height / 10 ))
            }
        }
    }
    func creatFourthDetailView() {
        if let myFourthDetailView = Bundle.main.loadNibNamed("SecondView", owner: self, options: nil)?.first as? SecondView {
            fourthDetailView.addSubview(myFourthDetailView)
            //fourthDetailView.roundCorners(corners: [.bottomLeft,.bottomRight] ,radius: 20)
            myFourthDetailView.detailImage.tag = 4
            myFourthDetailView.createdetailImage()
            myFourthDetailView.createdetailButton()
            myFourthDetailView.createfirstDetailLabel(text: "Face ID verification", size: 17)
            myFourthDetailView.createsecondDetailLabel(text: "Enabled", size: 11)
            myFourthDetailView.snp.makeConstraints { make in
//                make.size.equalTo(CGSize(width: view.frame.width / 1.1, height: view.frame.height / 10))
            }
        }
    }
    
    @IBAction func didTapLogOut(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
