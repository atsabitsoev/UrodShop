//
//  CatalogProtocols.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 14.04.2021.
//

import UIKit

protocol CatalogViewProtocol: UIView {
    
}

protocol CatalogPresenterProtocol: UIViewController {

}

protocol CatalogRouterProtocol {
    func dismiss(vc: UIViewController)
}
