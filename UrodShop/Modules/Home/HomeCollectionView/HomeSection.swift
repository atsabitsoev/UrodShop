//
//  HomeSection.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 26.03.2021.
//

import Foundation

struct HomeSection: Hashable {
    
    enum SectionType: Hashable {
        case categories
        case products
    }

    let type: SectionType
    let title: String
    let items: [HomeItem]    
}
