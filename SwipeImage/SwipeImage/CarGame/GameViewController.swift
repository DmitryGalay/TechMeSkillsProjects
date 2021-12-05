//
//  GameViewController.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 1.10.21.
//

import UIKit

protocol GameViewControllerDelegate {
    func startNewGame()
}

class GameViewController: UIViewController {
    let boatView = UIView()
    let monsterView = UIView()
    let starView = UIView()
    var timer = Timer()
    var timeStar = Timer()
    var timeMonster = Timer()
    var boatImageView = UIImageView()
    var monstersImageView = UIImageView()
    var starImageView = UIImageView()
    var heartsImageView: [UIImageView] = []
    var starsArrayImageView: [UIImageView] = []
    var monsters: [UIImage] = [
        UIImage(named: "monstr_1")!,
        UIImage(named: "monstr_1")!,
    ]
    let starRatingImageView = UIImageView(image: UIImage(named:"star")!)
    let firstHeartImageView = UIImageView(image:UIImage(named: "heart"))
    let secondHeartImageView = UIImageView(image:UIImage(named: "heart"))
    let thirdHeartImageView = UIImageView(image:UIImage(named: "heart"))
    let boatWitdh = 100
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startGame()
    }
    
    func startGame() {
        // creatMonster()
        animateBackground()
        createBoat()
        timerMonster()
        createMonsters()
        createSwipe()
        createStar()
        addScore()
        createHeals()
        timecheckMonstr()
        timeCheckStar()
    }
    
    func stopGame() {
        timer.invalidate()
    }
    
    func animateBackground() {
        let backgroundImage = UIImage(named:"background_car")!
        let backgroundImageView1 = UIImageView(image: backgroundImage)
        let backgroundImageView2 = UIImageView(image: backgroundImage)
        backgroundImageView1.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
        backgroundImageView1.contentMode = .scaleAspectFit
        self.view.addSubview(backgroundImageView1)
        backgroundImageView2.frame = CGRect(x: self.view.frame.origin.x, y: -1 * self.view.frame.size.height, width: self.view.frame.size.width, height: self.view.frame.height)
        backgroundImageView2.contentMode = .scaleAspectFit
        self.view.addSubview(backgroundImageView2)
        UIView.animate(withDuration: 5.5, delay: 0.0, options: [.repeat, .curveLinear], animations: {
            backgroundImageView1.frame = backgroundImageView1.frame.offsetBy(dx:0.0 , dy: backgroundImageView1.frame.size.height )
            backgroundImageView2.frame = backgroundImageView2.frame.offsetBy(dx: 0.0 ,dy:  backgroundImageView2.frame.size.height)
        })
    }
    
    func createBoat() {
        boatView.frame = CGRect(x:Int(view.frame.width) / 2  - boatWitdh / 2  , y: Int(view.frame.height) - boatWitdh / 2 - boatWitdh, width: boatWitdh, height: boatWitdh)
        boatView.addShadow()
        view.addSubview(boatView)
        boatImageView = UIImageView(frame: boatView.bounds)
        boatImageView.contentMode = .scaleAspectFill
        let boatImage = UIImage(named: "boat")
        boatImageView = UIImageView(image: boatImage)
        boatView.addSubview(boatImageView)
    }
    
    //    func creatMonster() {
    //        //let monsterView = UIView()
    //        let randomArr = [boatWitdh , boatWitdh*2 + 10 , boatWitdh*3 ]
    //        let monsterPositionX = randomArr.randomElement()
    //        monsterView.frame = CGRect(x: Int(CGFloat( monsterPositionX!)), y:
    //                                            Int(self.view.frame.minY) - self.boatWitdh ,
    //                                        width: self.boatWitdh / 2, height: self.boatWitdh)
    //        view.addSubview(monsterView)
    //        monstersImageView = UIImageView(frame: monsterView.bounds)
    //        monstersImageView.contentMode = .scaleAspectFill
    //        let monsterImage = UIImage(named: "monstr_1")
    //        monstersImageView = UIImageView(image: monsterImage)
    //        monsterView.addSubview(monstersImageView)
    //        randomMonster()
    //         UIView.animate(withDuration: 2, animations:  {
    //            self.monsterView.transform = CGAffineTransform(translationX:  0 , y: self.view.frame.height + CGFloat(self.boatWitdh))
    //    }, completion: { (nil) in
    //        self.monsterView.frame = CGRect(x: Int(CGFloat( monsterPositionX!)), y:
    //                                            Int(self.view.frame.minY) - self.boatWitdh ,
    //                                        width: self.boatWitdh / 2, height: self.boatWitdh)
    //        })
    //    }
    
    //    @objc func cheackMonstrPosition() {
    //        print(monsterView.layer.presentation()?.frame)
    //        if (self.monsterView.layer.presentation()?.frame.origin.y)! >= self.view.frame.height {
    //            creatMonster()
    //            //monsterView.removeFromSuperview()
    //        }
    //    }
    
    func createMonsters() {
        let randomArr = [boatWitdh , boatWitdh*2 + 10 , boatWitdh*3 ]
        let monsterPositionX = randomArr.randomElement()
        self.monsterView.frame = CGRect(x: Int(CGFloat( monsterPositionX!)), y:
                                            Int(self.view.frame.minY) - self.boatWitdh ,
                                        width: self.boatWitdh / 2, height: self.boatWitdh)
        view.addSubview(monsterView)
        monstersImageView = UIImageView(frame: monsterView.bounds)
        monstersImageView.contentMode = .scaleAspectFill
        let monsterImage = UIImage(named: "monstr_1")
        monstersImageView = UIImageView(image: monsterImage)
        monsterView.addSubview(monstersImageView)
        timerMonster()
    }
    
    func randomMonster() {
        let currentIndex = monsters.firstIndex(of: monstersImageView.image ?? UIImage()) ?? -1
        var nextIndex = currentIndex+1
        nextIndex = monsters.indices.contains(nextIndex) ? nextIndex : 0
        monstersImageView.image = monsters[nextIndex]
    }
    
    @objc func appearMonster() {
        randomMonster()
        let randomArr = [boatWitdh , boatWitdh*2 + 10 , boatWitdh*3 ]
        let monsterPositionX = randomArr.randomElement()
        self.monsterView.center = CGPoint(x: CGFloat(monsterPositionX!) , y: self.view.frame.minY  - CGFloat(self.boatWitdh ))
        UIView.animate(withDuration: 9,delay: 0.0 ,options: .repeat, animations:  {
            self.monsterView.transform = CGAffineTransform(translationX:  0 , y: self.view.frame.height + CGFloat(self.boatWitdh + self.boatWitdh))
        })
    }
    
    func timerMonster() {
        Timer.scheduledTimer(timeInterval: 10, target: self,selector: #selector(appearMonster),userInfo: AnyObject?.self, repeats: true)
    }
    
    func createStar() {
        let randomArr = [boatWitdh , boatWitdh*2  , boatWitdh*3 ]
        let starPositionX = randomArr.randomElement()
        self.starView.frame = CGRect(x: Int(CGFloat(starPositionX!)), y:
                                        Int(self.view.frame.minY) - self.boatWitdh,
                                     width: self.boatWitdh , height: self.boatWitdh)
        view.addSubview(starView)
        starImageView = UIImageView(frame: starView.bounds)
        starImageView.contentMode = .scaleAspectFill
        let starImage = UIImage(named: "star")
        starImageView = UIImageView(image: starImage)
        starView.addSubview(starImageView)
        timerStar()
    }
    
    func createStarRating() {
        if starsArrayImageView.count < 2 {
            let starRatingImageView = UIImageView(image: UIImage(named:"star")!)
            let valueStar = starsArrayImageView.count
            starRatingImageView.frame = CGRect(x: view.frame.minX + CGFloat(boatWitdh / 10) , y: view.frame.minY + CGFloat(boatWitdh) + CGFloat(boatWitdh  / 2 * valueStar) , width: CGFloat(boatWitdh / 2), height: CGFloat(boatWitdh / 2))
            starRatingImageView.contentMode = .scaleAspectFill
            view.addSubview(starRatingImageView)
            starsArrayImageView.append(starRatingImageView)
            print(starsArrayImageView.count)
        }else {
            if heartsImageView.count == 0 {
                for _ in starsArrayImageView {                starsArrayImageView.removeAll()
                }
                heartsImageView.append(firstHeartImageView)
                self.view.addSubview(firstHeartImageView)
                
            } else if heartsImageView.count == 1 {
                starsArrayImageView.removeAll()
                starRatingImageView.removeFromSuperview()
                heartsImageView.append(secondHeartImageView)
                self.view.addSubview(secondHeartImageView)
            } else if heartsImageView.count == 2 {
                for _ in 0...starsArrayImageView.count {                starRatingImageView.removeFromSuperview()
                    starsArrayImageView.removeAll()
                }
                self.view.willRemoveSubview(starRatingImageView)
                heartsImageView.append(thirdHeartImageView)
                self.view.addSubview(thirdHeartImageView)
            }
        }
    }
    
    @objc func appearStar() {
        let randomArr = [boatWitdh , boatWitdh*2 , boatWitdh*3]
        let starPositionX = randomArr.randomElement()
        self.starView.center = CGPoint(x: CGFloat(starPositionX!) , y: self.view.frame.minY  - CGFloat(self.boatWitdh))
        UIView.animate(withDuration: 8,delay: 0.0 ,options: .repeat, animations:  {
            self.starView.transform = CGAffineTransform(translationX:  0 , y: self.view.frame.height + CGFloat(self.boatWitdh)
                                                            + CGFloat(self.boatWitdh) )
        })
    }
    
    func timerStar() {
        timeStar = Timer.scheduledTimer(timeInterval: 10, target: self,selector: #selector(appearStar),userInfo: AnyObject?.self, repeats: true)
    }
    
    
    func rightAnimate() {
        UIView.animate(withDuration: 0.6, animations: {
            self.boatView.center = CGPoint(x: self.boatView.center.x + CGFloat(self.boatWitdh) ,
                                           y: self.boatView.center.y)
        })
        if boatView.frame.origin.x > view.frame.width - CGFloat(boatWitdh) {
            gameOver()
        }   
    }
    
    func leftAnimate() {
        UIView.animate(withDuration: 0.6, animations: {
            self.boatView.center = CGPoint(x: self.boatView.center.x - CGFloat(self.boatWitdh),
                                           y: self.boatView.center.y)
        })
        if boatView.frame.origin.x < CGFloat(boatWitdh) /  2 {
            gameOver()
        }
    }
    
    func addScore() {
        let backgroundStarImageView = UIImageView(image: UIImage(named:"star_background")!)
        let backgroundHeartImageView = UIImageView(image: UIImage(named:"heart_background")!)
        backgroundStarImageView.frame = CGRect(x: view.frame.minX + CGFloat(boatWitdh / 10), y: view.frame.minY + CGFloat(boatWitdh / 2), width: CGFloat(boatWitdh / 2), height: CGFloat(boatWitdh / 2))
        self.view.addSubview(backgroundStarImageView)
        backgroundHeartImageView.frame = CGRect(x: view.frame.maxX - CGFloat(boatWitdh / 10) - CGFloat(boatWitdh / 2), y: view.frame.minY + CGFloat(boatWitdh / 2), width: CGFloat(boatWitdh / 2), height: CGFloat(boatWitdh / 2))
        self.view.addSubview(backgroundHeartImageView)
    }
    
    func createHeals() {
        firstHeartImageView.frame = CGRect(x: view.frame.maxX - CGFloat(boatWitdh / 10) - CGFloat(boatWitdh / 2), y: view.frame.minY + CGFloat(boatWitdh) , width: CGFloat(boatWitdh / 2), height: CGFloat(boatWitdh / 2))
        heartsImageView.append(firstHeartImageView)
        self.view.addSubview(firstHeartImageView)
        secondHeartImageView.frame = CGRect(x: view.frame.maxX - CGFloat(boatWitdh / 10) - CGFloat(boatWitdh / 2), y: view.frame.minY + CGFloat(Double(boatWitdh) * 1.5), width: CGFloat(boatWitdh / 2), height: CGFloat(boatWitdh / 2))
        heartsImageView.append(secondHeartImageView)
        self.view.addSubview(secondHeartImageView)
        thirdHeartImageView.frame = CGRect(x: view.frame.maxX - CGFloat(boatWitdh / 10) - CGFloat(boatWitdh / 2), y: view.frame.minY + CGFloat(boatWitdh * 2) , width: CGFloat(boatWitdh / 2), height: CGFloat(boatWitdh / 2))
        heartsImageView.append(thirdHeartImageView)
        self.view.addSubview(thirdHeartImageView)
    }
    
    func createSwipe() {
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(createSwipeDirection(sender:)))
        leftSwipe.direction = .left
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(createSwipeDirection(sender:)))
        rightSwipe.direction = .right
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    }
    
    @objc func createSwipeDirection(sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .left:
            leftAnimate()
        case .right:
            rightAnimate()
        default:
            break
        }
    }
    
    func gameOver () {
        stopGame()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controler = storyboard.instantiateViewController(identifier: "GameOverViewController")
        controler.modalPresentationStyle = .overCurrentContext
        present(controler, animated: true)
        
    }
    
    func checkheart() {
        if heartsImageView.count == 2 {
            thirdHeartImageView.removeFromSuperview()
        }else if heartsImageView.count == 1 {
            secondHeartImageView.removeFromSuperview()
        }else if heartsImageView.count == 0 {
            firstHeartImageView.removeFromSuperview()
        }
    }
    
    func checkHearts() {
        if heartsImageView.count == 0 {
            gameOver()
        }
    }
    
    @objc func checkFrameMonstr() {
        checkheart()
        checkHearts()
        if monsterView.layer.presentation()!.frame.intersects(boatView.layer.presentation()!.frame) {
            stopGame()
            monsterView.removeFromSuperview()
            heartsImageView.removeLast()
            print(heartsImageView.count)
            createMonsters()
        }
    }
    
    @objc func checkFrameStar() {
        if  starView.layer.presentation()!.frame.intersects(boatView.layer.presentation()!.frame) {
            createStarRating()
            starView.removeFromSuperview()
            timeStar.invalidate()
            createStar()
        }
        
    }
    
    func timeCheckStar () {
        Timer.scheduledTimer(timeInterval: 0.5, target: self,selector: #selector(checkFrameStar),userInfo: AnyObject?.self, repeats: true)
    }
    
    func timecheckMonstr() {
        Timer.scheduledTimer(timeInterval: 0.5, target: self,selector: #selector(checkFrameMonstr),userInfo: AnyObject?.self, repeats: true)
    }
    
}

extension UIView {
    func intersects(_ otherView: UIView) -> Bool {
        if self === otherView { return false }
        return self.frame.intersects(otherView.layer.presentation()!.frame)
    }
}

extension GameViewController: GameViewControllerDelegate{
    func startNewGame() {
        startGame()
    }
}
