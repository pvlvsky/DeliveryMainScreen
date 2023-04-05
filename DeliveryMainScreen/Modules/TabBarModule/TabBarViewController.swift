//
//  TabBarViewController.swift
//  DeliveryMainScreen
//
//  Created by Ярослав Павловский on 5.04.23.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        let attributedFontNormal: UIFont = UIFont(name: "SFUIDisplay-Regular", size: 13) ?? .systemFont(ofSize: 13)
        
        let appearanceBar = UITabBar.appearance()
        appearanceBar.backgroundColor = UIColor.white
        appearanceBar.tintColor = UIColor.customRed
        appearanceBar.unselectedItemTintColor = UIColor.customGrey
        
        let appearanceBarItem = UITabBarItem.appearance(whenContainedInInstancesOf: [UINavigationController.self])
        appearanceBarItem.setTitleTextAttributes([NSAttributedString.Key.font: attributedFontNormal], for: .normal)
    }
}

