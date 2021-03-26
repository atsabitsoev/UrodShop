//
//  ProductItemsCollectionView.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 26.03.2021.
//

import UIKit

final class ProductItemsCollectionView: UIView {
    
    struct ViewModel {
        
        struct Item {
            let title: String
            let subTitle: String
            let accentText: String
            let image: UIImage
        }
        
        let title: String
        let items: [Item]
    }
    
    
    private let viewModel: ViewModel?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ProductItemCell.self, forCellWithReuseIdentifier: ProductItemCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .fill
        return stack
    }()
    
    
    init(viewModel: ViewModel? = nil) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setVerticalStackConstraints()
        super.updateConstraints()
    }
    
    
    private func setupView() {
        setNeedsUpdateConstraints()
        collectionView.layer.masksToBounds = false
        setupVerticalStack()
        setupCollectionView()
    }
    
    private func setupVerticalStack() {
        addSubview(verticalStack)
        verticalStack.addArrangedSubview(collectionView)
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}


extension ProductItemsCollectionView {
    
    private func setVerticalStackConstraints() {
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: topAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}


extension ProductItemsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let currentItem = viewModel?.items[indexPath.row],
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductItemCell.identifier, for: indexPath) as? ProductItemCell else { return UICollectionViewCell() }
        cell.configureCell(
            withModel: ProductItemCellModel(
                title: currentItem.title,
                subTitle: currentItem.subTitle,
                accentText: currentItem.accentText,
                image: currentItem.image
            )
        )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = 327
        let width = (height - 77) / 3 * 2
        return CGSize(width: width, height: height)
    }
}

