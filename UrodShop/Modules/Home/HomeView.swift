//
//  HomeView.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 13.04.2021.
//

import UIKit

final class HomeView: UIView, HomeViewProtocol {
    
    unowned private let presenter: HomePresenterProtocol
    
    
    private let searchTextField: UIView = SearchTextField()
    private let addButton: UIView = {
        let photoImage = UIImage(named: "photo")!
        let button = RoundedButton(image: photoImage)
        return button
    }()
    private let topHorizontalStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 16
        return $0
    }(UIStackView())
    private let collectionView: HomeCollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(HomeCollectionView())
    
    
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
        setTopHorizontalStackConstraints()
        setCollectionViewConstraints()
        super.updateConstraints()
    }
    
    
    private func setupView() {
        setNeedsUpdateConstraints()
        backgroundColor = UIColor.white
        addSubview(collectionView)
        addSubview(topHorizontalStack)
        topHorizontalStack.addArrangedSubview(searchTextField)
        topHorizontalStack.addArrangedSubview(addButton)
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
    private func setTopHorizontalStackConstraints() {
        NSLayoutConstraint.activate([
            topHorizontalStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 4),
            topHorizontalStack.heightAnchor.constraint(equalToConstant: 44),
            topHorizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            topHorizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    private func setCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topHorizontalStack.bottomAnchor, constant: 8),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
