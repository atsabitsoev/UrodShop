//
//  CartTableViewCell.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 19.04.2021.
//

import UIKit

final class CartItemCell: UITableViewCell {
    
    struct ViewModel {
        var image: UIImage
        var count: Int
        var title: String
        var subTitle: String
        var cost: String
    }
    
    
    static let identifier = "CartItemCell"
    
    private var viewModel: ViewModel?
    
    private lazy var productItemView: ProductItemView = { [unowned self] in
        let view = ProductItemView(
            viewModel: ProductItemView.ViewModel(
                title: "",
                subTitle: "",
                accentText: nil,
                image: UIImage()
            )
        )
        return view
    }()
    private lazy var counterView: CounterView = { [unowned self] in
        return CounterView(startValue: 0)
    }()
    private lazy var costLabel: UILabel = { [unowned self] in
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = UIColor.accentColor
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.text = self.viewModel?.cost
        return $0
    }(UILabel())
    
    
    override func updateConstraints() {
        setProductItemViewConstraints()
        setCounterViewConstraints()
        setCostLabelConstraints()
        super.updateConstraints()
    }
    
    
    func configureCell(withModel viewModel: ViewModel) {
        self.viewModel = viewModel
        setupCell()
    }
    
    
    private func setupCell() {
        setNeedsUpdateConstraints()
        selectionStyle = .none
        contentView.addSubview(productItemView)
        contentView.addSubview(counterView)
        contentView.addSubview(costLabel)
        
        setItem()
    }
    
    private func setItem() {
        guard let viewModel = self.viewModel else { return }
        productItemView.setViewModel(
            ProductItemView.ViewModel(
                title: viewModel.title,
                subTitle: viewModel.subTitle,
                accentText: nil,
                image: viewModel.image
            )
        )
        counterView.setNewValue(viewModel.count)
        costLabel.text = viewModel.cost
    }
    
}


extension CartItemCell {
    private func setProductItemViewConstraints() {
        NSLayoutConstraint.activate([
            productItemView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            productItemView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            productItemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productItemView.widthAnchor.constraint(equalToConstant: 200),
            productItemView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setCounterViewConstraints() {
        NSLayoutConstraint.activate([
            counterView.centerYAnchor.constraint(equalTo: productItemView.centerYAnchor, constant: -36),
            counterView.leadingAnchor.constraint(equalTo: productItemView.trailingAnchor, constant: 16),
            counterView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    private func setCostLabelConstraints() {
        NSLayoutConstraint.activate([
            costLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            costLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}
