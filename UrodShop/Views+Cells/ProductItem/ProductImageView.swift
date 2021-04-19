//
//  ProductImageView.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 25.03.2021.
//

import UIKit

final class ProductImageView: UIImageView {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupView()
    }
    
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 4
        layer.masksToBounds = true
        contentMode = .scaleAspectFill
    }
}
