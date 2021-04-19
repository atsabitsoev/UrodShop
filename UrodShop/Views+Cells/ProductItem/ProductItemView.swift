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
        let accentText: String?
        let image: UIImage
    }
    
    
    private var viewModel: ViewModel
    
    private let imageView: ProductImageView = ProductImageView()
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
    
    
    func setViewModel(_ viewModel: ViewModel) {
        self.viewModel = viewModel
        setupImageView()
        setupTitleLabel()
        setupSubTitleLabel()
        setupAccentLabel()
    }
    
    
    private func setupView() {
        setNeedsUpdateConstraints()
        translatesAutoresizingMaskIntoConstraints = false
        setupVerticalStack()
        setViewModel(viewModel)
    }
    
    private func setupVerticalStack() {
        addSubview(verticalStack)
        verticalStack.addArrangedSubview(imageView)
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(subTitleLabel)
        if viewModel.accentText != nil {
            verticalStack.addArrangedSubview(accentLabel)
        }
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
        if let accentText = viewModel.accentText {
            accentLabel.text = accentText
        }
    }
}


extension ProductItemView {
    private func setImageViewConstraints() {
        let stackViewHeight: CGFloat = viewModel.accentText == nil ? 50 : 77
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: verticalStack.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, constant: -stackViewHeight)
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
