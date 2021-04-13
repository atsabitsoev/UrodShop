//
//  HomeProtocols.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 13.04.2021.
//

import UIKit

protocol HomeViewProtocol: UIView {
}

protocol HomePresenterProtocol: UIViewController {
    func seeAllTapped()
}

protocol HomeRouterProtocol {
    func showCatalog(from vc: UIViewController)
}
