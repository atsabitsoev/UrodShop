//
//  HomeViewController.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 24.03.2021.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let roundIconView: RoundItemsCollectionView = {
        let icon = UIImage.add
        let view = RoundItemsCollectionView(
            viewModel: RoundItemsCollectionView.ViewModel(
                title: "Категории",
                items: [
                    RoundItemsCollectionView.ViewModel.Item(
                        icon: UIImage.add,
                        description: "Носки"
                    ),
                    RoundItemsCollectionView.ViewModel.Item(
                        icon: UIImage.add,
                        description: "Футболки"
                    ),
                    RoundItemsCollectionView.ViewModel.Item(
                        icon: UIImage.add,
                        description: "Носки"
                    ),
                    RoundItemsCollectionView.ViewModel.Item(
                        icon: UIImage.add,
                        description: "Носки"
                    ),
                    RoundItemsCollectionView.ViewModel.Item(
                        icon: UIImage.add,
                        description: "Носки"
                    ),
                    RoundItemsCollectionView.ViewModel.Item(
                        icon: UIImage.add,
                        description: "Носки"
                    ),
                    RoundItemsCollectionView.ViewModel.Item(
                        icon: UIImage.add,
                        description: "Носки"
                    ),RoundItemsCollectionView.ViewModel.Item(
                        icon: UIImage.add,
                        description: "Носки"
                    ),RoundItemsCollectionView.ViewModel.Item(
                        icon: UIImage.add,
                        description: "Носки"
                    ),
                    RoundItemsCollectionView.ViewModel.Item(
                        icon: UIImage.add,
                        description: "Носки"
                    ),
                    RoundItemsCollectionView.ViewModel.Item(
                        icon: UIImage.add,
                        description: "Носки"
                    ),
                    RoundItemsCollectionView.ViewModel.Item(
                        icon: UIImage.add,
                        description: "Носки"
                    )
                ]
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
            roundIconView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
}
