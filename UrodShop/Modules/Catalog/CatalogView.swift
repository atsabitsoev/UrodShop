//
//  CatalogView.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 14.04.2021.
//

import UIKit

final class CatalogView: UIView, CatalogViewProtocol {
    
    unowned private let presenter: CatalogPresenterProtocol & ABNavigationBarDelegate & ABSegmentedControlDelegate
    
    
    private let navigationBar: ABNavigationBar = ABNavigationBar(items: [.backItem, .title("Все товары"), .searchItem])
    private let segmentedControl: ABSegmentedControl = ABSegmentedControl(
        items: ["Футболки", "Брюки", "Носки", "Обувь", "Детские товары", "Аксессуары"],
        selectedIndex: 0
    )
    private let collectionView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(
        ProductItemsCollectionView(
            viewModel: ProductItemsCollectionView.ViewModel(
                items: [
                    ProductItemsCollectionView.ViewModel.Item(
                        title: "Футболка",
                        subTitle: "Хорошая",
                        accentText: "300₽",
                        image: UIImage(named: "man")!
                    ),
                    ProductItemsCollectionView.ViewModel.Item(
                        title: "Футболка",
                        subTitle: "Хорошая",
                        accentText: "300₽",
                        image: UIImage(named: "man")!
                    ),
                    ProductItemsCollectionView.ViewModel.Item(
                        title: "Футболка",
                        subTitle: "Хорошая",
                        accentText: "300₽",
                        image: UIImage(named: "man")!
                    ),
                    ProductItemsCollectionView.ViewModel.Item(
                        title: "Футболка",
                        subTitle: "Хорошая",
                        accentText: "300₽",
                        image: UIImage(named: "man")!
                    ),
                    ProductItemsCollectionView.ViewModel.Item(
                        title: "Футболка",
                        subTitle: "Хорошая",
                        accentText: "300₽",
                        image: UIImage(named: "man")!
                    ),
                    ProductItemsCollectionView.ViewModel.Item(
                        title: "Футболка",
                        subTitle: "Хорошая",
                        accentText: "300₽",
                        image: UIImage(named: "man")!
                    ),
                    ProductItemsCollectionView.ViewModel.Item(
                        title: "Футболка",
                        subTitle: "Хорошая",
                        accentText: "300₽",
                        image: UIImage(named: "man")!
                    )
                ]
            )
        )
    )
    
    
    init(presenter: CatalogPresenterProtocol & ABNavigationBarDelegate & ABSegmentedControlDelegate) {
        self.presenter = presenter
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setSegmentedControlConstraints()
        setCollectionViewConstraints()
        super.updateConstraints()
    }
    
    
    private func setupView() {
        setNeedsUpdateConstraints()
        backgroundColor = UIColor.white
        addSubview(collectionView)
        addSubview(navigationBar)
        addSubview(segmentedControl)
        navigationBar.delegate = presenter
        segmentedControl.segmentedDelegate = presenter
    }

}


extension CatalogView {
    private func setSegmentedControlConstraints() {
        NSLayoutConstraint.activate([
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            segmentedControl.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 30),
            segmentedControl.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 12),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
