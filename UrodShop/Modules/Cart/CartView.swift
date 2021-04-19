//
//  CartView.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 18.04.2021.
//

import UIKit
import PassKit

final class CartView: UIView, CartViewProtocol {
    
    unowned private let presenter: CartPresenterProtocol
    
    
    private let tableView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    private let paymentView: PaymentView = PaymentView()
    
    
    init(presenter: CartPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setTableViewConstraints()
        setPaymentViewConstraints()
        super.updateConstraints()
    }
    
    
    private func setupView() {
        setNeedsUpdateConstraints()
        backgroundColor = UIColor.white
        
        addSubview(tableView)
        addSubview(paymentView)
        paymentView.setCost("990₽")
    }
}


extension CartView {
    private func setTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: paymentView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setPaymentViewConstraints() {
        NSLayoutConstraint.activate([
            paymentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            paymentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            paymentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            paymentView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
}
