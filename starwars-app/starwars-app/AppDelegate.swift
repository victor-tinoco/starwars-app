//
//  AppDelegate.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 04/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appDI = AppDIContainer()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        let vc = appDI.makeDetailsViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigation = UINavigationController(rootViewController: vc)
        navigation.isNavigationBarHidden = true
        self.window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        
        return true
    }
}

