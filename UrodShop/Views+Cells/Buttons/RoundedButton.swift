//
//  RoundedButton.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 28.03.2021.
//

import UIKit

final class RoundedButton: SquaredButton {
        
    
    override init(image: UIImage, height: CGFloat = Constants.NavigationBar.itemHeight) {
        super.init(image: image, height: height)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setCornerRadius()
    }
    
    
    private func setupButton() {
        backgroundColor = UIColor.accentColor
        tintColor = .white
        layer.masksToBounds = true
    }
    
    private func setCornerRadius() {
        layer.cornerRadius = bounds.height / 2
    }
    
}
