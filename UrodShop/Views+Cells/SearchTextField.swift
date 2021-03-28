//
//  SearchTextField.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 28.03.2021.
//

import UIKit

final class SearchTextField: UITextField {
    
    private var textPadding = UIEdgeInsets(top: 0, left: 48, bottom: 0, right: 8)
    
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupTextField()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setCornerRadius()
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
        delegate = self
        setupLeftView()
        backgroundColor = UIColor.secondarySystemBackground
    }
    
    private func setupLeftView() {
        let searchImage = UIImage(systemName: "magnifyingglass")?
            .withRenderingMode(.alwaysTemplate)
        let searchImageView = UIImageView(image: searchImage)
        searchImageView.tintColor = UIColor(white: 0.1, alpha: 1)
        leftView = searchImageView
        leftViewMode = UITextField.ViewMode.always
    }
    
    private func setCornerRadius() {
        layer.cornerRadius = bounds.height / 2
    }
    
}


extension SearchTextField: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        leftViewMode = .never
        textPadding = UIEdgeInsets(top: textPadding.top, left: 16, bottom: textPadding.bottom, right: textPadding.right)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        leftViewMode = .always
        textPadding = UIEdgeInsets(top: textPadding.top, left: 48, bottom: textPadding.bottom, right: textPadding.right)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
