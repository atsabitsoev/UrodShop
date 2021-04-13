//
//  HomeViewController.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 24.03.2021.
//

import UIKit

final class HomePresenter: UIViewController, HomePresenterProtocol {
    
    private lazy var homeView: HomeViewProtocol = HomeView(presenter: self)
    private let router: HomeRouterProtocol = HomeRouter()
    
    
    override func loadView() {
        super.loadView()
        view = homeView
    }
    
    
    func seeAllTapped() {
        router.showCatalog(from: self)
    }
    
}
