//
//  HomeViewController.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 24.03.2021.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let roundIconView: ProductItemView = {
        let icon = UIImage.add
        let view = ProductItemView(
            viewModel: ProductItemView.ViewModel(
                title: "Уродец Геннадий",
                subTitle: "Футболка",
                accentText: "990 рублей",
                image: UIImage.checkmark
            )
        )
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
            roundIconView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            roundIconView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            roundIconView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            roundIconView.heightAnchor.constraint(equalToConstant: 327)
        ])
    }
}
