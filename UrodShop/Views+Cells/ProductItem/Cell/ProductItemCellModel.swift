//
//  ProductItemCellModel.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 26.03.2021.
//

import UIKit

struct ProductItemCellModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let subTitle: String
    let accentText: String
    let image: UIImage
}
