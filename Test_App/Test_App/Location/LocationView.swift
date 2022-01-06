//
//  LocationView.swift
//  Test_App
//
//  Created by Dima on 6.01.22.
//

import Foundation
import UIKit
import FirebaseStorage

class LocationView: UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
    
    @IBOutlet weak var locationName: UITextField!
    @IBOutlet weak var addPhoto: UIButton!
    @IBOutlet weak var collectionView : UICollectionView!
    
    var images = [UIImage]()
    private let storage = Storage.storage().reference()
    var searchTimer: Timer?
    
    // MARK: - Сreation parameters textfield
    
    public func createLabel() {
        locationName.settingTextField()
        locationName.backgroundColor = .clear
        locationName.placeholder = "Название локации"
        locationName.tintColor = UIColor(named: "textFieldColor")
        locationName.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidEditingChanged(_ textField: UITextField) {
        if searchTimer != nil {
            locationName.tintColor = UIColor(named: "textFieldColor")
            searchTimer?.invalidate()
            searchTimer = nil
        }
        searchTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(searchForKeyword(_:)), userInfo: textField.text!, repeats: true)
    }
    
    @objc func searchForKeyword(_ timer: Timer) {
        locationName.tintColor = .clear
    }
    
    // MARK: - Creation saveButton and add save to Firebase
    
    public func createAddPhoto() {
        addPhoto.setImage(UIImage(named:"add_btn"), for: .normal)
        addPhoto.tintColor = .black
        addPhoto.addTarget(self, action: #selector(addNewPhoto), for: .touchUpInside)
        addPhoto.frame.size = CGSize(width: 10, height: 10)
    }
    
    @objc func addNewPhoto() {
        for image in images {
            guard let imageData = image.pngData() else {
                return
            }
            guard let nameFile = locationName.text else {
                return
            }
            storage.child("images/\(nameFile).png").putData(imageData,
                                                            metadata: nil,
                                                            completion: { [self]_, error in
                guard error == nil else {
                    print("Filed to upload")
                    return
                }
                storage.child("images/file_\(images.count).png").downloadURL(completion: {url, error in
                    guard let  url = url, error == nil else {
                        return
                    }
                    let urlString = url.absoluteString
                    print("Download URL: \(urlString)")
                    UserDefaults.standard.set(urlString, forKey: "url")
                })
            })
        }
    }
    
    // MARK: - Filling the array with pictures
    
    public func createImage() {
        for i in 1...6{
            let image = UIImage(named: "image_\(i)")!
            images.append(image)
        }
    }
    
    public func createDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
        locationName.delegate = self
    }
    
    // MARK: - Registration cell
    
    override func awakeFromNib() {
        let nibName = UINib(nibName: "CollectionViewCell", bundle:nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    // MARK: - Setting cell
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let image = images[indexPath.item]
        cell.imageViewCell.image = image
        cell.imageViewCell.contentMode = .scaleAspectFit
        cell.roundCorners(corners: [.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 15)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: (collectionView.frame.width/3.2),
            height: (collectionView.frame.width/3.2))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageView = UIImageView(image: images[indexPath.item])
        imageView.frame = collectionView.bounds
        imageView.contentMode = .scaleToFill
        imageView.contentMode = .center
        UIView.animate(withDuration: 3,animations: {
            imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
        }, completion: { finished in
            print("Napkins opened!")
        })
        imageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        imageView.addGestureRecognizer(tap)
        collectionView.addSubview(imageView)
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
    }
}
