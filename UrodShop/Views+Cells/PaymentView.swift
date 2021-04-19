//
//  PaymentView.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 19.04.2021.
//

import UIKit
import PassKit

final class PaymentView: UIView {
    
    private var cost: String?
    
    private let paymentButton: UIButton = PKPaymentButton()
    private let costLabel: UILabel = {
        $0.textColor = UIColor.black
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        return $0
    }(UILabel())
    private let horizontalStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 24
        return $0
    }(UIStackView())
    
    
    init(cost: String? = nil) {
        self.cost = cost
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setHorizontalStackConstraints()
        super.updateConstraints()
    }
    
    
    func setCost(_ cost: String?) {
        costLabel.text = cost ?? ""
        if let cost = cost {
            costLabel.text = cost
            costLabel.isHidden = false
        } else {
            costLabel.isHidden = true
        }
    }
    
    
    private func setupView() {
        setNeedsUpdateConstraints()
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        setShadow()
        
        addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(paymentButton)
        horizontalStack.addArrangedSubview(costLabel)
        setCost(cost)
    }
    
    private func setShadow() {
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 8
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
    }
}


extension PaymentView {
    private func setHorizontalStackConstraints() {
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            horizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            horizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
}
