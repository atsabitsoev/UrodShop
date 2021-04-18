//
//  CatalogController.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 14.04.2021.
//

import UIKit

final class CatalogPresenter: UIViewController, CatalogPresenterProtocol {
    
    private lazy var catalogView: CatalogViewProtocol = CatalogView(presenter: self)
    private let router: CatalogRouterProtocol = CatalogRouter()
    
    
    override func loadView() {
        super.loadView()
        view = catalogView
    }
}


extension CatalogPresenter: ABNavigationBarDelegate {
    func backItemTapped() {
        router.dismiss(vc: self)
    }
}


extension CatalogPresenter: ABSegmentedControlDelegate {
    func indexSelected(_ index: Int) {
        print("Selected index: \(index)")
    }
}
