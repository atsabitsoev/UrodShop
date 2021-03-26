//
//  HomeViewController.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 24.03.2021.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let roundIconView: UIView = {
        let view = HomeCollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func updateViewConstraints() {
        setRoundIconViewConstraints()
        super.updateViewConstraints()
    }
    
    
    private func setupView() {
        view.setNeedsUpdateConstraints()
        view.backgroundColor = UIColor.white
        view.addSubview(roundIconView)
    }
    
}

extension HomeViewController {
    private func setRoundIconViewConstraints() {
        NSLayoutConstraint.activate([
            roundIconView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            roundIconView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            roundIconView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            roundIconView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
