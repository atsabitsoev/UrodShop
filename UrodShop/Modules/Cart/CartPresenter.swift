//
//  CartPresenter.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 18.04.2021.
//

import UIKit

final class CartPresenter: UIViewController, CartPresenterProtocol {
    
    private lazy var cartView: CartViewProtocol = CartView(presenter: self)
    private let router: CartRouterProtocol = CartRouter()
    
    
    override func loadView() {
        super.loadView()
        view = cartView
    }
}
