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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = SignUpViewController.instantiate(viewModel: SignUpViewModel(registerUseCase: SignUpUseCase(signUpImpl: SignUpRepositorImpl())))
        window?.makeKeyAndVisible()
        return true
    }
}

