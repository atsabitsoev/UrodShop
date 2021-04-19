//
//  HomeCollectionView.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 26.03.2021.
//

import UIKit

final class HomeCollectionView: UIView {
    
    private var dataSource: UICollectionViewDiffableDataSource<HomeSection, HomeItem>?
    
    private var sections: [HomeSection] = []
    private var headerActions: [Int: (title: String, action: () -> ())] = [:]
    
    private lazy var collectionView: UICollectionView = { [unowned self] in
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RoundItemCell.self, forCellWithReuseIdentifier: RoundItemCell.identifier)
        collectionView.register(ProductItemCell.self, forCellWithReuseIdentifier: ProductItemCell.identifier)
        collectionView.register(SectionHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderReusableView.reuseIdentifier)
        collectionView.backgroundColor = UIColor.white
        collectionView.delaysContentTouches = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        return collectionView
    }()
    
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setCollectionViewConstraints()
        super.updateConstraints()
    }
    
    
    func reloadCollectionView(sections: [HomeSection]) {
        self.sections = sections
        reloadData()
    }
    
    func setHeaderInfo(_ info: (title: String, action: () -> ()), for index: Int) {
        headerActions[index] = info
    }
    
    
    private func setupView() {
        setNeedsUpdateConstraints()
        translatesAutoresizingMaskIntoConstraints = false
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        setDataSource()
        reloadData()
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [unowned self] (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let section = self.sections[sectionIndex]
            switch section.type {
            case .categories:
                let section = createCategoriesSection()
                return section
            case .products:
                let section = createProductsSection()
                return section
            }
        }
        return layout
    }
    
    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<HomeSection, HomeItem>(
            collectionView: collectionView,
            cellProvider: { [unowned self] (collectionView, indexPath, item) -> UICollectionViewCell? in
                switch self.sections[indexPath.section].type {
                case .categories:
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoundItemCell.identifier, for: indexPath) as? RoundItemCell else { return nil }
                    switch item {
                    case .category(let model):
                        cell.configureCell(withModel: model)
                    default: return nil
                    }
                    return cell
                case .products:
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductItemCell.identifier, for: indexPath) as? ProductItemCell else { return nil }
                    switch item {
                    case .product(let model):
                        cell.configureCell(withModel: model)
                    default: return nil
                    }
                    return cell
                }
            }
        )
        
        setHeaderViews()
    }
    
    private func setHeaderViews() {
        dataSource?.supplementaryViewProvider = { [unowned self] (collectionView, kind, indexPath) -> UICollectionReusableView? in
            guard kind == UICollectionView.elementKindSectionHeader else {
                return nil
              }
            guard let view = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: SectionHeaderReusableView.reuseIdentifier,
                    for: indexPath
            ) as? SectionHeaderReusableView else { return nil }
            guard let section = self.dataSource?.snapshot().sectionIdentifiers[indexPath.section] else { return nil }
            
            view.setTitle(section.title)
            
            if let headerInfo = headerActions[indexPath.section] {
                view.setButton(text: headerInfo.title, action: headerInfo.action)
            }
            return view
        }
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<HomeSection, HomeItem>()
        snapshot.appendSections(sections)
        
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        
        dataSource?.apply(snapshot)
    }
    
    private func createCategoriesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .estimated(80), heightDimension: .estimated(110))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        let layoutSectionHeader = createCategoriesSectionHeader()
        layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
        layoutSection.orthogonalScrollingBehavior = .continuous
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 12, bottom: 0, trailing: 12)
        return layoutSection
    }
    
    private func createProductsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0)
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(327))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitem: layoutItem, count: 2)
        layoutGroup.interItemSpacing = .fixed(12)
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.interGroupSpacing = 16
        let layoutSectionHeader = createProductsSectionHeader()
        layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        return layoutSection
    }
    
    private func createCategoriesSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.95),
            heightDimension: .estimated(80)
        )
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        return layoutSectionHeader
    }
    
    private func createProductsSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.95),
            heightDimension: .absolute(90)
        )
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        return layoutSectionHeader
    }
}


extension HomeCollectionView {
    private func setCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
