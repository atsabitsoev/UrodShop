//
//  HomeRouter.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 13.04.2021.
//

import UIKit


final class HomeRouter: HomeRouterProtocol {
    
    func showCatalog(from vc: UIViewController) {
        let catalog = CatalogPresenter()
        vc.navigationController?.show(catalog, sender: nil)
    }
}
