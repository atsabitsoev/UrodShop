//
//  SearchTextField.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 28.03.2021.
//

import UIKit

final class SearchTextField: UITextField {
    
    private var textPadding = UIEdgeInsets(top: 0, left: 54, bottom: 0, right: 8)
    
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupTextField()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setCornerRadius()
    }
    
    override func updateConstraints() {
        heightAnchor.constraint(equalToConstant: Constants.NavigationBar.itemHeight).isActive = true
        super.updateConstraints()
    }
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10)
        return super.clearButtonRect(forBounds: bounds).inset(by: padding)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(
            by: UIEdgeInsets(
                top: 10,
                left: 16,
                bottom: 10,
                right: bounds.width - 42
            )
        )
    }
    
    
    private func setupTextField() {
        setNeedsUpdateConstraints()
        delegate = self
        placeholder = "Поиск"
        clearButtonMode = .whileEditing
        setupLeftView()
        backgroundColor = UIColor.secondarySystemBackground
    }
    
    private func setupLeftView() {
        let searchImage = UIImage(systemName: "magnifyingglass")?
            .withRenderingMode(.alwaysTemplate)
        let searchImageView = UIImageView(image: searchImage)
        searchImageView.tintColor = UIColor(white: 0.2, alpha: 1)
        leftView = searchImageView
        leftViewMode = UITextField.ViewMode.always
    }
    
    private func setCornerRadius() {
        layer.cornerRadius = bounds.height / 2
    }
    
}


extension SearchTextField: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
