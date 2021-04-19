//
//  RoundItemView.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 24.03.2021.
//

import UIKit

final class RoundItemView: UIView {
    
    struct ViewModel {
        let icon: UIImage
        let description: String
    }
    
    
    private let viewModel: ViewModel
    
    private let iconView: RoundIconView = {
        let view = RoundIconView()
        view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return view
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor(white: 0.1, alpha: 1)
        return label
    }()
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.axis = .vertical
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
        setIconViewConstraints()
        setVerticalStackConstraints()
        super.updateConstraints()
    }
    
    
    private func setupView() {
        setNeedsUpdateConstraints()
        translatesAutoresizingMaskIntoConstraints = false
        setupVerticalStack()
        setupIconView()
        setupDescriptionLabel()
    }
    
    private func setupVerticalStack() {
        addSubview(verticalStack)
        verticalStack.addArrangedSubview(iconView)
        verticalStack.addArrangedSubview(descriptionLabel)
    }
    
    private func setupIconView() {
        iconView.setImage(viewModel.icon)
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.text = viewModel.description
    }
    
}


extension RoundItemView {
    private func setIconViewConstraints() {
        NSLayoutConstraint.activate([
            iconView.heightAnchor.constraint(equalTo: iconView.widthAnchor),
            iconView.widthAnchor.constraint(equalTo: verticalStack.widthAnchor)
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
