//
//  AppDelegate.swift
//  DeliveryMainScreen
//
//  Created by Ярослав Павловский on 4.04.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let tabBarNavigationController = AppAssembly.shared.mainView()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarNavigationController
        window?.makeKeyAndVisible()
        return true
    }
}
