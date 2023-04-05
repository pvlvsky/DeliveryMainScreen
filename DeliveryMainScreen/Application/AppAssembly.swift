//
//  AppAssembly.swift
//  DeliveryMainScreen
//
//  Created by Ярослав Павловский on 4.04.23.
//

import UIKit

protocol AppAssemblyProtocol: AnyObject {
    func mainView() -> UINavigationController
}

protocol AppTabBarAssembly: AnyObject {
    func productListView() -> UINavigationController
    func contactView() -> UINavigationController
    func profileView() -> UINavigationController
    func basketView() -> UINavigationController
}

final class AppAssembly: AppAssemblyProtocol {

    static let shared = AppAssembly()

    private init() {}

    func mainView() -> UINavigationController {
        let tabBarController = TabBarViewController()
        let navigationController = UINavigationController(rootViewController: tabBarController)
        navigationController.isNavigationBarHidden = true
        
        let productListView = productListView()
        let contactView = contactView()
        let profileView = profileView()
        let basketView = basketView()
        
        tabBarController.setViewControllers([productListView, contactView, profileView, basketView], animated: true)
        
        return navigationController
    }
}

extension AppAssembly: AppTabBarAssembly {
        
    func productListView() -> UINavigationController {
        let productListView = ProductListModulBuilder.buildModule()
        
        let productListNavigationController = UINavigationController(rootViewController: productListView)
        productListNavigationController.isNavigationBarHidden = true
        productListNavigationController.tabBarItem = UITabBarItem.init(title: "Меню", image: UIImage(named: "Menu"), tag: 0)
        productListNavigationController.tabBarItem.badgeColor = UIColor.red
        return productListNavigationController
    }
    
    func contactView() -> UINavigationController {
        let contactVC = ContactViewController()
        let contactNC = UINavigationController(rootViewController: contactVC)
        contactNC.tabBarItem = UITabBarItem.init(title: "Контакты", image: UIImage(named: "Contact"), tag: 1)
        contactNC.tabBarItem.badgeColor = UIColor.red
        return contactNC
    }
    
    func profileView() -> UINavigationController {
        let profileVC = ProfileViewController()
        let profileNC = UINavigationController(rootViewController: profileVC)
        profileNC.tabBarItem = UITabBarItem.init(title: "Профиль", image: UIImage(named: "Profile"), tag: 2)
        return profileNC
    }
    
    func basketView() -> UINavigationController {
        let basketView = BasketViewController()
        let basketNavigationController = UINavigationController(rootViewController: basketView)
        basketNavigationController.tabBarItem = UITabBarItem.init(title: "Корзина", image: UIImage(named: "Basket"), tag: 3)
        return basketNavigationController
    }
}

