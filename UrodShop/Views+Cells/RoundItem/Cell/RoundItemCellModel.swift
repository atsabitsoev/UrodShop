//
//  RoundItemCellModel.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 26.03.2021.
//

import UIKit

struct RoundItemCellModel: Identifiable, Hashable {
    let id = UUID()
    let icon: UIImage
    let description: String
}
