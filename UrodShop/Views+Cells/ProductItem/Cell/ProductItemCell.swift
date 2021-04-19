//
//  ProductItemCell.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 26.03.2021.
//

import UIKit

final class ProductItemCell: UICollectionViewCell {
    
    static let identifier: String = "ProductItemCell"
    
    private var cellModel: ProductItemCellModel? = nil
    
    private lazy var itemView: UIView = { [unowned self] in
        guard let cellModel = self.cellModel else { return UIView() }
        let view = ProductItemView(
            viewModel: ProductItemView.ViewModel(
                title: cellModel.title,
                subTitle: cellModel.subTitle,
                accentText: cellModel.accentText,
                image: cellModel.image
            )
        )
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setItemViewConstraints()
        super.updateConstraints()
    }
    
    
    func configureCell(withModel model: ProductItemCellModel) {
        self.cellModel = model
        setupCell()
    }
    
    private func setupCell() {
        setNeedsUpdateConstraints()
        contentView.addSubview(itemView)
    }
}


extension ProductItemCell {
    private func setItemViewConstraints() {
        NSLayoutConstraint.activate([
            itemView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
