//
//  RoundedButton.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 28.03.2021.
//

import UIKit

final class RoundedButton: UIButton {
    
    private let image: UIImage
    private let height: CGFloat
    
    
    init(image: UIImage, height: CGFloat = 44) {
        self.image = image
        self.height = height
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setCornerRadius()
    }
    
    override func updateConstraints() {
        setButtonConstraints()
        super.updateConstraints()
    }
    
    
    private func setupButton() {
        setNeedsUpdateConstraints()
        backgroundColor = UIColor.accentColor
        tintColor = .white
        setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
        layer.masksToBounds = true
    }
    
    private func setCornerRadius() {
        layer.cornerRadius = bounds.height / 2
    }
    
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                alpha = 0.3
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.alpha = 1
                }
            }
        }
    }
}


extension RoundedButton {
    private func setButtonConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalTo: widthAnchor),
            heightAnchor.constraint(equalToConstant: height)
        ])
    }
}
