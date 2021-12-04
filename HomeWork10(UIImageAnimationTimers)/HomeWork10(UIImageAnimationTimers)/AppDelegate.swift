//
//  AppDelegate.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 28.09.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //var images: [UIImage] = [
    //        "image_1",
    //        "image_2",
    //        "image_3",
    //        "image_4",
    //       "image_5",
    //        "image_6",
    //        "image_7",
    //         "image_8",
    //       "image_9",
    //       "image_10",
    //        "image_11",
    //       "image_12",
    //       "image_13",
    //       "image_14",
    //        "image_15",
    //       "image_16",
    //        "image_17",
    //        "image_18",
    //       "image_19",
    //       "image_20")!
    //    ]

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

