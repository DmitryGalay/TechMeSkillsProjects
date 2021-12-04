//
//  SwipeImageViewController.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 29.09.21.
//
protocol SwipeImageDelegate{
    func checkBlur(isBlur: Bool)
    func getImage()
}

enum direction {
    case up
    case down
    case left
    case right
}

import UIKit
import Gemini

class SwipeImage: UIViewController , UIImagePickerControllerDelegate & UINavigationControllerDelegate
 ,UICollectionViewDelegate,UICollectionViewDataSource{
    private var alert: Alert!
    var logoImages: [UIImageView] = []
    var imageVIP: [UIImage] = []
    var mainImageView = UIImageView()
    let newView = UIImageView()
    var images: [UIImage] = []
    let slideAnimation = SlideAnimationDown()

    let likeImage = UIImage(named: "heart")
    let subValue = 1.5
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var collectionView: GeminiCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSHomeDirectory())
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .black
        createImage()
        doubleTap()
        self.collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        configureAnimation()
        createSwipe()
        //        mainImageView = UIImageView(frame: mainView.bounds)
        //        mainImageView.contentMode = .scaleAspectFill
        //        mainView.addSubview(mainImageView)
        
        //        let RandomImage = Int(arc4random_uniform(UInt32(self.images.count)))
        //        let yourImage: UIImage = images[RandomImage]
        //        mainImageView.image = yourImage
        newView.image = likeImage
        newView.contentMode = .scaleAspectFit
        newView.frame = CGRect(x: mainView.frame.midX - 30, y: mainView.frame.midY - mainView.frame.midY / 2 , width: 50, height: 50)
        mainView.addSubview(newView)
        newView.isHidden = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SwipeImageCell", for: indexPath) as! SwipeImageCell
        let image = images[indexPath.item]
        cell.swipeImageView.image = image
        cell.swipeImageView.layer.cornerRadius = 25
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
    
    func configureAnimation() {
        collectionView.gemini
            .rollRotationAnimation()
            .degree(90)
           
       }
    
    func createImage() {
        for i in 1...20{
            let image = UIImage(named: "image_\(i)")!
            images.append(image)
        }
    }
    func saveImage(image: UIImage, withName name: String, withDirectory nameDirectory: String ) -> Bool {
        let fileManager = FileManager.default
        let name = name
        let nameDirectory = nameDirectory
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        let path = directory.appendingPathComponent(nameDirectory)
        try? fileManager.createDirectory(at: path!, withIntermediateDirectories: true, attributes: [:])
        do {
            try data.write(to: path!.appendingPathComponent(name))
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    //    func addNextImage() {
    //        let currentIndex = images.firstIndex(of: mainImageView.image ?? UIImage()) ?? -1
    //        var nextIndex = currentIndex+1
    //        nextIndex = images.indices.contains(nextIndex) ? nextIndex : 0
    //        mainImageView.image = images[nextIndex]
    //    }
    //
    //    func removeImage() {
    //        if imageVIP.count > 0 {
    //            self.images.append(self.mainImageView.image!)
    //            if let removedIndex = imageVIP.firstIndex(where: { $0 === mainImageView.image }) {
    //                imageVIP.remove(at: removedIndex)
    //            }
    //        }
    //    }
    //
    //    func showImageVIP() {
    //        if imageVIP.count > 0 {
    //            let currentIndex = imageVIP.firstIndex(of: mainImageView.image ?? UIImage()) ?? -1
    //            var nextIndex = currentIndex+1
    //            nextIndex = imageVIP.indices.contains(nextIndex) ? nextIndex : 0
    //            mainImageView.image = imageVIP[nextIndex]
    //        }
    //    }
    
        func registerForKeyboard() {
            NotificationCenter.default.addObserver(self, selector: #selector(kbShow), name: UIResponder.keyboardWillShowNotification , object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(kbHide), name: UIResponder.keyboardWillHideNotification , object: nil)
        }
        
        func removeKeyBoard() {
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        
        @objc func kbShow(notification: NSNotification) {
            let userInfo = notification.userInfo
            let kbSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey ] as! NSValue).cgRectValue
            alert.scrollView.contentOffset = CGPoint(x: 0, y: kbSize.height / 2)
        }
    
        @objc func kbHide(notification: NSNotification) {
            alert.scrollView.contentOffset = CGPoint.zero
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

    func doubleTap() {
        let tapOnView = UITapGestureRecognizer(target: self, action:#selector(likeAction(sender:)))
        tapOnView.numberOfTapsRequired = 2
        mainView.addGestureRecognizer(tapOnView)
    }
    //
    @objc func likeAction(sender: UITapGestureRecognizer) {
        self.newView.isHidden = false
        //        self.imageVIP.append(self.mainImageView.image!)
        //        _ = saveImage(image: mainImageView.image!, withName: "\(imageVIP.count)", withDirectory: "Images/FotoAlbum")
        if images.count > 1 {
            if let removedIndex = images.firstIndex(where: { $0 === mainImageView.image }) {
                images.remove(at: removedIndex)
            }
        }
        UIView.animate(withDuration: 0.9, animations: {
            self.newView.transform = CGAffineTransform(scaleX: 2, y: 2)
        }) {(finished)  in
            UIView.animate(withDuration: 0.5, delay: 0.01, options:.curveEaseIn ,animations: {
                self.newView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            }) {(finished)  in
                self.newView.isHidden = true
            }
        }
    }
    
        func alertSaveMessage(message: String) {
            let alert = UIAlertController(title: "Save", message: message, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    
        func UpAnimate() {
            self.dismiss(animated: true)
        }
    
        func downAnimate() {
            imageVIP.removeDuplicates()
            sendToLogin()
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let controler = storyboard.instantiateViewController(identifier: "MyViewController")
//            controler.modalPresentationStyle = .overFullScreen
//           present(controler, animated: true)
        }
    
        func leftAnimate() {
            imageVIP.removeDuplicates()
            sendToLogin()
        }
    
        func rightAnimate() {
            print(images.count)
            print(imageVIP.count)
        }

        func createSwipe() {
            let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(createSwipeDirection(sender:)))
            upSwipe.direction = .up
            let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(createSwipeDirection(sender:)))
            downSwipe.direction = .down
            let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(createSwipeDirection(sender:)))
            leftSwipe.direction = .left
            let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(createSwipeDirection(sender:)))
            rightSwipe.direction = .right
            view.addGestureRecognizer(upSwipe)
            view.addGestureRecognizer(downSwipe)
            view.addGestureRecognizer(leftSwipe)
            view.addGestureRecognizer(rightSwipe)
        }
    
        @objc func createSwipeDirection(sender: UISwipeGestureRecognizer) {
            switch sender.direction {
            case .up:
                UpAnimate()
            case .down:
                downAnimate()
            case .left:
                leftAnimate()
            case .right:
                rightAnimate()
            default:
                break
            }
        }
    
    func sendToLogin() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let loginVC = storyboard.instantiateViewController(withIdentifier: String(describing: LoginViewController.classForCoder())) as? LoginViewController {
            loginVC.gameDelegate = self
            loginVC.modalPresentationStyle = .overCurrentContext
            present(loginVC, animated: true, completion: nil)
        }
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}

extension SwipeImage: SwipeImageDelegate {
    
    func checkBlur(isBlur: Bool) {
        if isBlur == true {
            view.createBlur()
        }else {
            view.delBlur()
        }
    }
    
    func getImage() {
        //        let piker = UIImagePickerController()
        //        piker.allowsEditing = true
        //        piker.delegate = self
        //        piker.sourceType = .photoLibrary
        //        present(piker, animated: true)
    }
}

extension SwipeImage: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 10, height: collectionView.frame.height / 1.58)
    }
}
