//
//  ABSegmentLabel.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 18.04.2021.
//

import UIKit

final class ABSegmentButton: UIButton {
    
    private var action: (() -> ())?
    
    private let selectedColor: UIColor = UIColor.black
    private let unSelectedColor: UIColor = UIColor.darkGray
    
    private let selectedFont: UIFont = UIFont.boldSystemFont(ofSize: 16)
    private let unSelectedFont: UIFont = UIFont.boldSystemFont(ofSize: 16)
    
    
    init(action: (() -> ())? = nil) {
        self.action = action
        super.init(frame: .zero)
        addAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setSelected(_ selection: Bool) {
        let color = selection ? selectedColor : unSelectedColor
        setTitleColor(color, for: .normal)
        
        let font = selection ? selectedFont : unSelectedFont
        titleLabel?.font = font
    }
    
    func setAction(action: (() -> ())? = nil) {
        self.action = action
    }
    
    
    private func addAction() {
        addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    
    @objc private func tap() {
        action?()
    }
}
