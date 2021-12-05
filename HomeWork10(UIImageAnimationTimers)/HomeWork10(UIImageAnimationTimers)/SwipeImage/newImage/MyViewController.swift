//
//  MyViewController.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 17.11.21.
//

import UIKit
import Gemini

struct ImageName: Codable{
    let name: String
}
var imageDic:[String:UIImage] = [:]
class MyViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var images = [UIImage]()
    @IBOutlet weak var collectionView: GeminiCollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.frame = .zero
        collectionView.backgroundColor = .black
        collectionView.dataSource = self
        collectionView.delegate = self
        createImage()
        collectionView.gemini
            .scaleAnimation()
            .scale(0.6)
            .scaleEffect(.scaleUp)
      
    }
    
    func createImage() {
        for i in 1...20{
            let image = UIImage(named: "image_\(i)")!
            let value = "image_\(i)"
            imageDic.updateValue(image, forKey: value)
            images.append(image)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageDic.values.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! CollectionViewCell
        
        let image = images[indexPath.item]
        cell.mainImageView.image = image
        cell.mainImageView.layer.cornerRadius = 25
        self.collectionView.animateCell(cell)
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
         self.collectionView.animateVisibleCells()
     }
 
     func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
         if let cell = cell as? CollectionViewCell {
             self.collectionView.animateCell(cell)
         }
     }
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
       // print(indexPath.item)
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
}

extension MyViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 10, height: collectionView.frame.height / 1.58)
    }
   
}
