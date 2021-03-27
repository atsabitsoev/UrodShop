//
//  HeaderButton.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 27.03.2021.
//

import UIKit

final class HeaderButton: UIButton {
    
    private var action: (() -> ())?
    
    
    init(action: (() -> ())? = nil) {
        self.action = action
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setAction(_ action: (() -> ())? = nil) {
        self.action = action
    }
    
    
    private func setupButton() {
        setNeedsUpdateConstraints()
        setTitleColor(UIColor.black, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 14)
        titleLabel?.textAlignment = .right
        addTarget(self, action: #selector(tap), for: UIControl.Event.touchUpInside)
    }
    
    
    @objc private func tap() {
        action?()
    }
}


extension HeaderButton {
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                alpha = 0.5
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.alpha = 1
                }
            }
        }
    }
}
