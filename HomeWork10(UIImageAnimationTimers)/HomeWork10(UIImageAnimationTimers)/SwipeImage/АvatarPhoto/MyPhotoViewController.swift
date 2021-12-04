//
//  CollectionViewController.swift
//  CollectionView
//
//  Created by Dima on 4.10.21.
//

import UIKit

private let reuseIdentifier = "Cell"
//var images: [UIImage] = [
//    UIImage(named: "image_1")!,
//    UIImage(named: "image_2")!,
//    UIImage(named: "image_3")!,
//    UIImage(named: "image_4")!,
//    UIImage(named: "image_5")!,
//    UIImage(named: "image_6")!,
//    UIImage(named: "image_7")!,
//    UIImage(named: "image_8")!,
//    UIImage(named: "image_9")!,
//    UIImage(named: "image_10")!,
//    UIImage(named: "image_11")!,
//    UIImage(named: "image_12")!,
//    UIImage(named: "image_13")!,
//    UIImage(named: "image_14")!,
//    UIImage(named: "image_15")!,
//    UIImage(named: "image_16")!,
//    UIImage(named: "image_17")!,
//    UIImage(named: "image_18")!,
//    UIImage(named: "image_19")!,
//    UIImage(named: "image_20")!
//]
//var arrPhoto: [UIImageView] = []
let newImage = UIImageView()
var previouslySelectedIndexPath: NSIndexPath?

class MyPhotoViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(MyPhotoViewCell.self, forCellWithReuseIdentifier: MyPhotoViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .lightGray
        navigationController?.navigationBar.barTintColor = .lightGray
        navigationController?.navigationBar.tintColor = .darkGray
    }
    
 
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myPhotoViewCell", for: indexPath) as! MyPhotoViewCell
//        cell.imageOutlet.image = images[indexPath.row]
//        cell.layer.cornerRadius = 2
        return cell
    }
   
}
