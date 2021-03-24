//
//  RoundItemCell.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 25.03.2021.
//

import UIKit

final class RoundItemCell: UICollectionViewCell {
    
    struct CellModel {
        let icon: UIImage
        let description: String
    }
    
        
    static let identifier: String = "RoundItemCell"
    
    private var cellModel: CellModel? = nil
    
    private lazy var itemView: RoundItemView = { [unowned self] in
        guard let cellModel = self.cellModel else {
            let emptyView = RoundItemView(
                viewModel: RoundItemView.ViewModel(
                    icon: UIImage.remove,
                    description: "Пусто"
                )
            )
            emptyView.translatesAutoresizingMaskIntoConstraints = false
            return emptyView
        }
        let view = RoundItemView(
            viewModel: RoundItemView.ViewModel(
                icon: cellModel.icon,
                description: cellModel.description
            )
        )
        view.translatesAutoresizingMaskIntoConstraints = false
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
    
    
    func configureCell(withModel model: CellModel) {
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
