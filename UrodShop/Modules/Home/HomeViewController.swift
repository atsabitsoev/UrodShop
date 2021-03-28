//
//  HomeViewController.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 24.03.2021.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let searchTextField: UIView = {
        let textField = SearchTextField()
        return textField
    }()
    private let addButton: UIView = {
        let photoImage = UIImage(named: "photo")!
        let button = RoundedButton(image: photoImage)
        return button
    }()
    private let topHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()
    private let collectionView: UIView = {
        let view = HomeCollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func updateViewConstraints() {
        setTopHorizontalStackConstraints()
        setCollectionViewConstraints()
        super.updateViewConstraints()
    }
    
    
    private func setupView() {
        view.setNeedsUpdateConstraints()
        view.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        view.addSubview(topHorizontalStack)
        topHorizontalStack.addArrangedSubview(searchTextField)
        topHorizontalStack.addArrangedSubview(addButton)
    }
    
}

extension HomeViewController {
    private func setTopHorizontalStackConstraints() {
        NSLayoutConstraint.activate([
            topHorizontalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topHorizontalStack.heightAnchor.constraint(equalToConstant: 44),
            topHorizontalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            topHorizontalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topHorizontalStack.bottomAnchor, constant: 8),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
