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
        tabBar.tintColor = .black
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 8
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.1
    }
    
    private func configureViewControllers() {
        let homeVC = HomeViewController()
        let obzorSelectedImage = UIImage(named: "obzorSelected")!
        let obzorNotSelectedImage = UIImage(named: "obzorNotSelected")!
        let homeItem = UITabBarItem(title: nil, image: obzorNotSelectedImage, selectedImage: obzorSelectedImage)
        homeVC.tabBarItem = homeItem
        
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        let vcItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        vc.tabBarItem = vcItem
        
        viewControllers = [homeVC, vc]
    }
}
