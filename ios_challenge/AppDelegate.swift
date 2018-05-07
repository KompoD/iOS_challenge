//
//  AppDelegate.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05.05.2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Setup window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let controllerForPresent = MainBuilder.build()
        window?.rootViewController = controllerForPresent
        
        return true
    }
}
