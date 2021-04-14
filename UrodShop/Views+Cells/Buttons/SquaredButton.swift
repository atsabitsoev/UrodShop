//
//  SquaredButton.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 14.04.2021.
//

import UIKit

class SquaredButton: UIButton {
    
    private let image: UIImage
    private let height: CGFloat
    private var action: (() -> ())?

    
    init(image: UIImage, height: CGFloat = Constants.NavigationBar.itemHeight) {
        self.image = image
        self.height = height
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    
    func setAction(_ action: (() -> ())? = nil) {
        self.action = action
    }
    
    
    private func setupButton() {
        setNeedsUpdateConstraints()
        addTarget(self, action: #selector(tap), for: .touchUpInside)
        tintColor = UIColor.black
        setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
    }
    
    
    @objc private func tap() {
        action?()
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


extension SquaredButton {
    func setConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalTo: widthAnchor),
            heightAnchor.constraint(equalToConstant: height)
        ])
    }
}
