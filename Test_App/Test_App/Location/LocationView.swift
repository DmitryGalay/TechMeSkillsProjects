//
//  LocationView.swift
//  Test_App
//
//  Created by Dima on 6.01.22.
//

import Foundation
import UIKit

class LocationView: UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var addPhoto: UIButton!
    @IBOutlet weak var collectionView : UICollectionView!
    
    var images = [UIImage]()
    
    func add () {
       
    }
    
    func createLabel(text: String) {
        locationName.font = UIFont.systemFont(ofSize: 38)
        locationName.setText(text, withColorPart: "", color: .lightGray)
        locationName.textColor = .lightGray
        locationName.textAlignment = .left
    }
    
    func createAddPhoto() {
       
        addPhoto.setImage(UIImage(named:"add_btn"), for: .normal)
        addPhoto.tintColor = .black
        addPhoto.addTarget(self, action: #selector(addNewPhoto), for: .touchUpInside)
    }
    
    @objc func addNewPhoto() {

    }
    
    func createCollection() {
        collectionView.backgroundColor = .clear
    }
    
    func createImage() {
        for i in 1...6{
            let image = UIImage(named: "image_\(i)")!
            images.append(image)
        }
    }
    
        override func awakeFromNib() {
            collectionView.dataSource = self
            collectionView.delegate = self
//            collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
            let nibName = UINib(nibName: "CollectionViewCell", bundle:nil)
            collectionView.register(nibName, forCellWithReuseIdentifier: "CollectionViewCell")
    
    
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
//        let image = images[indexPath.item]
//
//        cell.imageViewCell.image = image
//        cell.imageViewCell.contentMode = .scaleAspectFill
        cell.backgroundColor = .black
        cell.roundCorners(corners: [.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 15)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: (collectionView.frame.width/3),
            height: (collectionView.frame.width/3))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
    
}
