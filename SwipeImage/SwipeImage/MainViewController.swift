//
//  MainViewController.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 30.09.21.
//

import UIKit

class MainViewController: UIViewController, UNUserNotificationCenterDelegate {
    @IBOutlet weak var runBall: UIButton!
    @IBOutlet weak var car: UIButton!
    @IBOutlet weak var swipeImage: UIButton!
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNotificationCenter.delegate = self
        let buttons = [runBall, car, swipeImage]
        buttons.forEach{ $0?.addShadow()}
        buttons.forEach{ $0?.addGradient()}
        self.requestNotificationAuthorization()
        self.sendNotification()
    }
    
    func requestNotificationAuthorization() {
        let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
        self.userNotificationCenter.requestAuthorization(options: authOptions) { (success, error) in
            if let error = error {
                print("Error: ", error)
            }
        }
    }
    
    func sendNotification() {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Обновление"
        notificationContent.body = "Необходимо обновить приложение"
        notificationContent.badge = NSNumber(value: 1)
        
        
        if let url = Bundle.main.url(forResource: "dune",
                                     withExtension: "png") {
            if let attachment = try? UNNotificationAttachment(identifier: "dune",
                                                              url: url,
                                                              options: nil) {
                notificationContent.attachments = [attachment]
            }
        }
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,
                                                        repeats: false)
        let request = UNNotificationRequest(identifier: "testNotification",
                                            content: notificationContent,
                                            trigger: trigger)
        userNotificationCenter.add(request) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
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
