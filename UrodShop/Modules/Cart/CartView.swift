//
//  CartView.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 18.04.2021.
//

import UIKit

final class CartView: UIView, CartViewProtocol {
    
    unowned private let presenter: CartPresenterProtocol
    
    
    private let tableView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    private let paymentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowRadius = 8
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.1
        $0.backgroundColor = UIColor.red
        return $0
    }(UIView())
    
    
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
            paymentView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
