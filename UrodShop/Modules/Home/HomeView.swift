//
//  HomeView.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 13.04.2021.
//

import UIKit

final class HomeView: UIView, HomeViewProtocol {
    
    unowned private let presenter: HomePresenterProtocol
    
    
    private let navigationBar: UIView = ABNavigationBar(items: [.searchField, .photoItem])
    private let collectionView: HomeCollectionView = HomeCollectionView()
    
    
    private let sections = [
        HomeSection(
            type: .categories,
            title: "Категории",
            items: [
                HomeItem.category(RoundItemCellModel(icon: UIImage(named: "skeakers")!, description: "Футболки")),
                HomeItem.category(RoundItemCellModel(icon: UIImage(named: "skeakers")!, description: "Носки")),
                HomeItem.category(RoundItemCellModel(icon: UIImage(named: "skeakers")!, description: "Футболки")),
                HomeItem.category(RoundItemCellModel(icon: UIImage(named: "skeakers")!, description: "Футболки")),
                HomeItem.category(RoundItemCellModel(icon: UIImage(named: "skeakers")!, description: "Футболки")),
                HomeItem.category(RoundItemCellModel(icon: UIImage(named: "skeakers")!, description: "Футболки")),
                HomeItem.category(RoundItemCellModel(icon: UIImage(named: "skeakers")!, description: "Футболки"))
            ]
        ),
        HomeSection(
            type: .products,
            title: "Популярное",
            items: [
                HomeItem.product(
                    ProductItemCellModel(
                        title: "Уродец Гена",
                        subTitle: "Носки",
                        accentText: "990₽",
                        image: UIImage(named: "man")!
                    )
                ),
                HomeItem.product(
                    ProductItemCellModel(
                        title: "Уродец Гена",
                        subTitle: "Носки",
                        accentText: "990₽",
                        image: UIImage(named: "man")!
                    )
                ),HomeItem.product(
                    ProductItemCellModel(
                        title: "Уродец Гена",
                        subTitle: "Носки",
                        accentText: "990₽",
                        image: UIImage(named: "man")!
                    )
                ),
                HomeItem.product(
                    ProductItemCellModel(
                        title: "Уродец Гена",
                        subTitle: "Носки",
                        accentText: "990₽",
                        image: UIImage(named: "man")!
                    )
                ),
                HomeItem.product(
                    ProductItemCellModel(
                        title: "Уродец Гена",
                        subTitle: "Носки",
                        accentText: "990₽",
                        image: UIImage(named: "man")!
                    )
                ),
                HomeItem.product(
                    ProductItemCellModel(
                        title: "Уродец Гена",
                        subTitle: "Носки",
                        accentText: "990₽",
                        image: UIImage(named: "man")!
                    )
                ),
                HomeItem.product(
                    ProductItemCellModel(
                        title: "Уродец Гена",
                        subTitle: "Носки",
                        accentText: "990₽",
                        image: UIImage(named: "man")!
                    )
                ),
                HomeItem.product(
                    ProductItemCellModel(
                        title: "Уродец Гена",
                        subTitle: "Носки",
                        accentText: "990₽",
                        image: UIImage(named: "man")!
                    )
                ),
                HomeItem.product(
                    ProductItemCellModel(
                        title: "Уродец Гена",
                        subTitle: "Носки",
                        accentText: "990₽",
                        image: UIImage(named: "man")!
                    )
                )
            ]
        )
    ]
    
    
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        setupView()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setCollectionViewConstraints()
        super.updateConstraints()
    }
    
    
    private func setupView() {
        setNeedsUpdateConstraints()
        backgroundColor = UIColor.white
        addSubview(navigationBar)
        addSubview(collectionView)
    }
    
    private func setupCollectionView() {
        let title = "Посмотреть все"
        let action = { [unowned self] in
            self.seeAllTapped()
        }
        collectionView.setHeaderInfo((title: title, action: action), for: 1)
        collectionView.reloadCollectionView(sections: sections)
    }
    
    private func seeAllTapped() {
        presenter.seeAllTapped()
    }
    
}


extension HomeView {
    
    private func setCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 8),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
