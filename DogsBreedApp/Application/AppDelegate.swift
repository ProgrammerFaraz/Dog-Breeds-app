//
//  AppDelegate.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 25/10/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.rootViewController = HomeDependencyProvider.navigationController
        return true
    }
}

