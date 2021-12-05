//
//  PhotoViewController.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 8.11.21.
//

import UIKit
import Gemini

//struct ImageName: Codable{
//    let name: String
//}
//var imageDic:[String:UIImage] = [:]
private let reuseIdentifier = "Cell"
class ImageViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    var images = [UIImage]()
    
    @IBOutlet weak var collectionView:
        UICollectionView!
    //        GeminiCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.frame = .zero
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        for i in 1...20{
            let image = UIImage(named: "image_\(i)")!
            let value = "image_\(i)"
            imageDic.updateValue(image, forKey: value)
        
            
            images.append(image)
        }
        //        collectionView.gemini
        //            .scaleAnimation()
        //            .scale(0.75)
        //            .scaleEffect(.scaleUp)
    }
    
//    func addToDefaults() {
//        let defaults = UserDefaults.standard
//        let encoder = JSONEncoder()
//        let coments = ImageName(name: [imageDic.keys])
//        if let data = try? encoder.encode(coments.commentText) {
//            defaults.set(data, forKey: "1")
//        }
//    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageDic.values.count
       
           
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! MyImageViewCell
        let image = images[indexPath.item]
        cell.imageView.image = image
        //self.collectionView.animateCell(cell)
        return cell
    }
    
    //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //        self.collectionView.animateVisibleCells()
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    //        if let cell = cell as? MyImageViewCell {
    //            self.collectionView.animateCell(cell)
    //        }
    //    }
    
    func addToDefaults() {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        if let data = try? encoder.encode("") {
            for (key,_) in imageDic {
            defaults.set(data, forKey: key)
        }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        addToDefaults()
        let imageNew = images[indexPath.item]
        //print(indexPath.item)
        let imageView = UIImageView(image: imageNew)
        imageView.frame = self.view.frame
        imageView.backgroundColor = .black
        imageView.contentMode = .center
        imageView.isUserInteractionEnabled = true
        let tapclose = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        tapclose.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(tapclose)
        self.view.addSubview(imageView)
        
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        commentsView()
        sender.view?.removeFromSuperview()
        
    }
    
    func commentsView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let commentVC = storyboard.instantiateViewController(withIdentifier: String(describing: CommentViewController.classForCoder())) as? CommentViewController {
            //let imageDic = self.imageDic
            let navigationController = UINavigationController(rootViewController: commentVC)
            navigationController.modalPresentationStyle = .overCurrentContext
            present(navigationController, animated: true, completion: nil)

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: ((view.frame.width/3)-3),
            height: (view.frame.width/3)-3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return ((view.frame.width/5))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 1, bottom: 3, right: 1)
    }
}
