//
//  CatalogRouter.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 14.04.2021.
//

import UIKit

final class CatalogRouter: CatalogRouterProtocol {
    
    func dismiss(vc: UIViewController) {
        vc.navigationController?.popViewController(animated: true)
    }
}
