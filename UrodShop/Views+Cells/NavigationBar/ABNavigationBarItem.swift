//
//  ABNavigationBarItem.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 14.04.2021.
//

import UIKit

enum ABNavigationBarItem: Equatable {
    case backItem
    case searchField
    case photoItem
    case title(String)
    case empty
}


extension ABNavigationBarItem {
    func getView(delegate: ABNavigationBarDelegate?) -> UIView {
        switch self {
        case .backItem:
            let image = UIImage(systemName: "chevron.backward")!
            let button: SquaredButton = SquaredButton(image: image, height: Constants.NavigationBar.backItemWidth)
            button.setAction(delegate?.backItemTapped)
            return button
        case .photoItem:
            let photoImage = UIImage(named: "photo")!
            let button = RoundedButton(image: photoImage)
            return button
        case .searchField:
            return SearchTextField()
        case .title(let text):
            let label = TitleLabel()
            label.text = text
            return label
        case .empty:
            let view = ABNavigationBarEmptyItem()
            return view
        }
    }
}
