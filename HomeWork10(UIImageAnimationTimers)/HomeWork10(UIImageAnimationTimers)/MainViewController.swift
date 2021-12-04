//
//  MainViewController.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 30.09.21.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var runBall: UIButton!
    @IBOutlet weak var car: UIButton!
    @IBOutlet weak var swipeImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttons = [runBall, car, swipeImage]
        buttons.forEach{ $0?.addShadow()}
        buttons.forEach{ $0?.addGradient()}
    }
    
    @IBAction func didTapRunBall(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controler = storyboard.instantiateViewController(identifier: "RunBall")
        controler.modalPresentationStyle = .overCurrentContext
       present(controler, animated: true)
    }
    
    @IBAction func didTapSwipeImage(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controler = storyboard.instantiateViewController(identifier: "SwipeImage")
        controler.modalPresentationStyle = .overCurrentContext
       present(controler, animated: true)
    }
   
    @IBAction func didTapBloody(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controler = storyboard.instantiateViewController(identifier: "GameViewController")
        controler.modalPresentationStyle = .overCurrentContext
       present(controler, animated: true)
    }
    
}
