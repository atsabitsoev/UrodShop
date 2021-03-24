//
//  RoundItemsCollectionView.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 25.03.2021.
//

import UIKit

final class RoundItemsCollectionView: UIView {
    
    struct ViewModel {
        
        struct Item {
            let icon: UIImage
            let description: String
        }
        
        let title: String
        let items: [Item]
    }
    
    
    private let viewModel: ViewModel?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(RoundItemCell.self, forCellWithReuseIdentifier: RoundItemCell.identifier)
        return collectionView
    }()
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
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
        setTitleLabelConstraints()
        setVerticalStackConstraints()
        super.updateConstraints()
    }
    
    
    private func setupView() {
        setNeedsUpdateConstraints()
        collectionView.layer.masksToBounds = false
        setupVerticalStack()
        setupTitleLabel()
        setupCollectionView()
    }
    
    private func setupVerticalStack() {
        addSubview(verticalStack)
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(collectionView)
    }
    
    private func setupTitleLabel() {
        guard let title = viewModel?.title else { return }
        titleLabel.text = title
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}


extension RoundItemsCollectionView {
    private func setTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    private func setVerticalStackConstraints() {
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: topAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}


extension RoundItemsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let currentItem = viewModel?.items[indexPath.row],
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoundItemCell.identifier, for: indexPath) as? RoundItemCell else { return UICollectionViewCell() }
        cell.configureCell(
            withModel: RoundItemCell.CellModel(
                icon: currentItem.icon,
                description: currentItem.description
            )
        )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height
        let width = height / 5 * 3
        return CGSize(width: width, height: height)
    }
}
