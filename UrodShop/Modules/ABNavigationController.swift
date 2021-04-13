//
//  ABNavigationController.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 13.04.2021.
//

import UIKit

final class ABNavigationController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    private func setupView() {
        setNavigationBarHidden(true, animated: false)
        interactivePopGestureRecognizer?.delegate = nil
    }
}
