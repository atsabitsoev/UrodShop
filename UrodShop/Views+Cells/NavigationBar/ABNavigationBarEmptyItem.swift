//
//  ABNavigationBarEmptyItem.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 14.04.2021.
//

import UIKit

final class ABNavigationBarEmptyItem: UIView {
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        heightAnchor.constraint(equalToConstant: Constants.NavigationBar.itemHeight).isActive = true
        widthAnchor.constraint(equalToConstant: Constants.NavigationBar.itemWidth).isActive = true
        super.updateConstraints()
    }
    
    
    private func setupView() {
        setNeedsUpdateConstraints()
    }
}
