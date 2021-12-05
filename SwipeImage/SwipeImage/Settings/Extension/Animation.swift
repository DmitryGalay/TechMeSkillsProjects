//
//  Animation.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 8.11.21.
//

import Foundation
import UIKit

class SlideAnimationDown: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

let durationAnimation = 1.5
func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return self
}

func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return self
}

func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return durationAnimation
}

func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }
    guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
    let contener = transitionContext.containerView
    
    let screenOffUp = CGAffineTransform(translationX: 0, y: -contener.frame.height)
    let screenOffDown = CGAffineTransform(translationX: 0, y: contener.frame.height)
    
    contener.addSubview(fromView)
    contener.addSubview(toView)
    
    toView.transform = screenOffUp
    
    UIView.animate(withDuration: durationAnimation, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: [], animations: {
        fromView.transform = screenOffDown
        fromView.alpha = 0.5
        toView.transform = CGAffineTransform.identity
        toView.alpha = 1
    }) { (success) in
        transitionContext.completeTransition(success)
        }
    
    }

}


/*  add
import UIKit

class ViewController: UIViewController {

 let slideAnimation = SlideAnimationDown()


   override func viewDidLoad() {
       super.viewDidLoad()
 
   }


 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "segueAnimation" {
        let dvc = segue.destination as! DestinationViewController
        dvc.transitioningDelegate = slideAnimation
    }
}

    @IBAction func performAction(_ sender: UIButton) {
    
    }
*/
