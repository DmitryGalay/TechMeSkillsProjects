//
//  ViewController.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 28.09.21.
//

import UIKit

class RunBall: UIViewController {
    var mainImage = UIImageView()
    var mainTimer = Timer()
    var moveTimer = Timer()
    var moveImageTimer = Timer()
    var mainMenuImageTimer = Timer()
    var timerSeconds = 10
    var mainTimerMax = 5
    var menuImageTime = 1
    var degree = CGFloat(Double.pi / 360 )
    var isValue :Bool = false
    var timer : Timer?
    
    @IBOutlet weak var mainMenuImageText: UILabel!
    @IBOutlet weak var mainMenuImage: UIImageView!
    @IBOutlet weak var mainTimerText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMenutext()
        mainImage.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width:CGFloat(Int(view.frame.width) / 4) , height: CGFloat(Double(Int(view.frame.width)) / 4.1))
        mainImage.image = UIImage(named: "ball")
        mainMenuImageText.isHidden = true
        mainMenuImage.isHidden = true
        view.addSubview(mainImage)
        startMainTimer()
        
    }
    
    func createMenutext() {
        let text = "Поехали"
        let textColor = UIColor.white
        let font = UIFont.systemFont(ofSize: 50)
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.white
        shadow.shadowBlurRadius = 5
        shadow.shadowOffset = CGSize(width: 5, height: 5)
        
        
        let attributes :[NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.shadow: shadow
        ]
        let attributesText = NSAttributedString(string: text, attributes: attributes)
        mainMenuImageText.attributedText = attributesText
    }
    
    func startTimerRotate () {
        Timer.scheduledTimer(timeInterval: 0.02, target: self,selector: #selector(roteteView),userInfo: AnyObject?.self, repeats: true)
    }
    
    func isEmpty(rect:CGRect) -> Bool {
        let isInSuperView = view.frame.contains(rect)
        var isValue = true
        view.subviews.forEach {
            subview in
            if subview.frame.intersects(rect) {
                isValue = false
            }
        }
        return isInSuperView && !isValue
    }
    
    @objc func moveImage() {
        let isEmpty =  isEmpty(rect: mainImage.frame)
        let viewHeight = view.frame.size.height
        let viewWidth = view.frame.size.width
        UIView.animate(withDuration: 0.6, animations: {
            if isEmpty {
                self.mainImage.transform = CGAffineTransform(translationX:  self.view.frame.origin.x, y: self.view.frame.origin.y + viewHeight - self.mainImage.frame.width)
            }
        }) {(finished) in
            UIView.animate(withDuration: 0.6, animations:  {
                if isEmpty {
                    self.mainImage.transform = CGAffineTransform(translationX:  self.view.frame.origin.x + viewWidth - self.mainImage.frame.width, y: self.view.frame.origin.y + viewHeight - self.mainImage.frame.width)
                }
            }) {(finished) in
                UIView.animate(withDuration: 0.6, animations:  {
                    if isEmpty {
                        self.mainImage.transform = CGAffineTransform(translationX:  self.view.frame.origin.x + viewWidth - self.mainImage.frame.width, y: self.view.frame.origin.y)
                    }
                }) {(finished) in
                    UIView.animate(withDuration: 0.6, animations:  {
                        if isEmpty {
                            self.mainImage.transform = CGAffineTransform(translationX:  self.view.frame.origin.x  ,y: self.view.frame.origin.y)
                        }
                    })
                }
            }
        }
    }
    
    func startMoveImage() {
        Timer.scheduledTimer(timeInterval: 2.4, target: self, selector: #selector(moveImage), userInfo: nil, repeats: true)
        
    }
    
    @objc func roteteView() {
        UIView.animate(withDuration: 0.01, delay: 0, options: UIView.AnimationOptions.curveLinear, animations:  { () -> Void in
            let main = CGAffineTransform(rotationAngle: self.degree)
            self.mainImage.transform = main
        })  {(finished) ->  Void in
            self.degree += CGFloat(Double.pi / 180)
        }
    }
    
    private func startMainTimer() {
        mainTimerMax = 4
        mainTimer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(updateMainTimer),
                                         userInfo: nil,
                                         repeats: true)
        RunLoop.current.add(mainTimer, forMode: .common)
        mainTimer.tolerance = 0.1
    }
    
    private func MenuImageTimer() {
        menuImageTime = 3
        mainMenuImageTimer = Timer.scheduledTimer(timeInterval: 1.0,
                                                  target: self,
                                                  selector: #selector(addMenuImage),
                                                  userInfo: nil,
                                                  repeats: true)
        RunLoop.current.add(mainMenuImageTimer, forMode: .common)
        mainMenuImageTimer.tolerance = 0.1
    }
    
    @objc func addMenuImage() {
        menuImageTime -= 1
        mainMenuImageText.isHidden = false
        mainMenuImage.isHidden = false
        stopMenuImageTimer()
    }
    
    func stopMenuImageTimer() {
        if menuImageTime == 0{
            mainMenuImageTimer.invalidate()
            mainMenuImage.isHidden = true
            mainMenuImageText.isHidden = true
            mainTimerText.isHidden = true
            startMoveImage()
        }
    }
    
    @objc func updateMainTimer() {
        if    mainTimerMax == 1 {
            MenuImageTimer()
            mainTimer.invalidate()
            //startTimerRotate()
        }else {
            mainTimerMax -= 1
            mainTimerText.text = String(mainTimerMax)
            mainTimerText.isHidden = false
        }
    }
    
    @IBAction func didTapHome(_ sender: UIButton) {
        self.dismiss(animated: true) 
    }
}
