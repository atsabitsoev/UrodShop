//
//  HomeViewController.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 24.03.2021.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let roundIconView: RoundIconView = {
        let view = RoundIconView(iconImage: UIImage.init())
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
            roundIconView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            roundIconView.heightAnchor.constraint(equalToConstant: 60),
            roundIconView.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
}
