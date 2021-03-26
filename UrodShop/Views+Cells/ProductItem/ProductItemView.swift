//
//  ProductItemView.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 25.03.2021.
//

import UIKit

///Оптимальная высота View: 327
final class ProductItemView: UIView {
    
    struct ViewModel {
        let title: String
        let subTitle: String
        let accentText: String
        let image: UIImage
    }
    
    
    private let viewModel: ViewModel
    
    private let imageView: ProductImageView = {
        let imageView = ProductImageView()
        imageView.backgroundColor = UIColor.gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
        return label
    }()
    private let accentLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.accentColor
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()
    
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setImageViewConstraints()
        setVerticalStackConstraints()
        super.updateConstraints()
    }
    
    
    private func setupView() {
        setNeedsUpdateConstraints()
        setupVerticalStack()
        setupImageView()
        setupTitleLabel()
        setupSubTitleLabel()
        setupAccentLabel()
    }
    
    private func setupVerticalStack() {
        addSubview(verticalStack)
        verticalStack.addArrangedSubview(imageView)
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(subTitleLabel)
        verticalStack.addArrangedSubview(accentLabel)
        verticalStack.setCustomSpacing(8, after: imageView)
        verticalStack.setCustomSpacing(8, after: subTitleLabel)
    }
    
    private func setupImageView() {
        imageView.image = viewModel.image
    }
    
    private func setupTitleLabel() {
        titleLabel.text = viewModel.title
    }
    
    private func setupSubTitleLabel() {
        subTitleLabel.text = viewModel.subTitle
    }
    
    private func setupAccentLabel() {
        accentLabel.text = viewModel.accentText
    }
}


extension ProductItemView {
    private func setImageViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: verticalStack.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, constant: -77)
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
