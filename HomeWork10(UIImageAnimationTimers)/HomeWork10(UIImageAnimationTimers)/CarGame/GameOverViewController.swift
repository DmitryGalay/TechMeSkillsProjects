//
//  GameOverViewController.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 3.10.21.
//

import UIKit

class GameOverViewController: UIViewController {
    var delegate: GameViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didTapHome(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func didTapRepeat(_ sender: UIButton) {
        self.delegate?.startNewGame()
        self.dismiss(animated: true)
    }
    
}
