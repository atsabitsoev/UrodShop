//
//  CatalogView.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 14.04.2021.
//

import UIKit

final class CatalogView: UIView, CatalogViewProtocol {
    
    unowned private let presenter: CatalogPresenterProtocol & ABNavigationBarDelegate
    
    
    private let navigationBar: ABNavigationBar = ABNavigationBar(items: [.backItem, .title("Все товары"), .empty])
    
    
    init(presenter: CatalogPresenterProtocol & ABNavigationBarDelegate) {
        self.presenter = presenter
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        setNeedsUpdateConstraints()
        backgroundColor = UIColor.white
        addSubview(navigationBar)
        navigationBar.delegate = presenter
    }

}
