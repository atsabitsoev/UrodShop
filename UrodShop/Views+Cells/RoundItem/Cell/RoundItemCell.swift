//
//  RoundItemCell.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 25.03.2021.
//

import UIKit

final class RoundItemCell: UICollectionViewCell {
        
    static let identifier: String = "RoundItemCell"
    
    private var cellModel: RoundItemCellModel? = nil
    
    private lazy var itemView: UIView = { [unowned self] in
        guard let cellModel = self.cellModel else { return UIView() }
        let view = RoundItemView(
            viewModel: RoundItemView.ViewModel(
                icon: cellModel.icon,
                description: cellModel.description
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
    
    
    func configureCell(withModel model: RoundItemCellModel) {
        self.cellModel = model
        setupCell()
    }
    
    private func setupCell() {
        setNeedsUpdateConstraints()
        contentView.addSubview(itemView)
    }
}


extension RoundItemCell {
    private func setItemViewConstraints() {
        NSLayoutConstraint.activate([
            itemView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
