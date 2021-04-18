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
        let homeVC = HomePresenter()
        let homeNavigationController = ABNavigationController(rootViewController: homeVC)
        let obzorSelectedImage = UIImage(named: "obzorSelected")!
        let obzorNotSelectedImage = UIImage(named: "obzorNotSelected")!
        let homeItem = UITabBarItem(title: nil, image: obzorNotSelectedImage, selectedImage: obzorSelectedImage)
        homeNavigationController.tabBarItem = homeItem
        
        let cartVC = CartPresenter()
        let cartNavigationController = ABNavigationController(rootViewController: cartVC)
        let cartNotSelectedImage = UIImage(named: "CartNotSelected")!
        let cartSelectedImage = UIImage(named: "CartSelected")!
        let cartItem = UITabBarItem(title: nil, image: cartNotSelectedImage, selectedImage: cartSelectedImage)
        cartNavigationController.tabBarItem = cartItem
        
        viewControllers = [homeNavigationController, cartNavigationController]
    }
}
