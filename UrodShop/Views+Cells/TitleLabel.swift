//
//  TitleLabel.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 14.04.2021.
//

import UIKit

final class TitleLabel: UILabel {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupLabel()
    }
    
    override func updateConstraints() {
        heightAnchor.constraint(equalToConstant: Constants.NavigationBar.itemHeight).isActive = true
        super.updateConstraints()
    }
    
    
    private func setupLabel() {
        setNeedsUpdateConstraints()
        font = UIFont.boldSystemFont(ofSize: 20)
        textAlignment = .center
    }
}
