//
//  ABTabBarController.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 28.03.2021.
//

import UIKit

final class ABTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        configureViewControllers()
    }
    
    
    private func configureTabBar() {
        tabBar.isTranslucent = false
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 8
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.1
    }
    
    private func configureViewControllers() {
        let homeVC = HomeViewController()
        let homeItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        homeVC.tabBarItem = homeItem
        viewControllers = [homeVC]
    }
}
