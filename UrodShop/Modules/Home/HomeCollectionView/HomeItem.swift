//
//  HomeItem.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 26.03.2021.
//

import Foundation

enum HomeItem: Identifiable, Hashable {
    var id: UUID { UUID() }
    case category(RoundItemCellModel)
    case product(ProductItemCellModel)
}
