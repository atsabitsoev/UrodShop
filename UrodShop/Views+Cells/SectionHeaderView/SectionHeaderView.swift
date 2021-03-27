//
//  SectionHeaderReusableView.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 26.03.2021.
//

import UIKit


class SectionHeaderReusableView: UICollectionReusableView {
    static var reuseIdentifier: String {
        return String(describing: SectionHeaderReusableView.self)
    }
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 1
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return label
    }()
    private let rightButton: HeaderButton = {
        let button = HeaderButton()
        return button
    }()
    private let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        setHorizontalStackConstraints()
    }
    
    
    func setTitle(_ text: String) {
        titleLabel.text = text
    }
    
    func setButton(text: String, action: (() -> ())? = nil) {
        rightButton.setTitle(text, for: .normal)
        rightButton.setAction(action)
    }
    
    
    private func setupView() {
        setNeedsUpdateConstraints()
        backgroundColor = .systemBackground
        setupHorizontalStack()
    }
    
    private func setupHorizontalStack() {
        addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(titleLabel)
        horizontalStack.addArrangedSubview(rightButton)
    }
}


extension SectionHeaderReusableView {
    private func setHorizontalStackConstraints() {
        NSLayoutConstraint.activate([
            horizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            horizontalStack.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

