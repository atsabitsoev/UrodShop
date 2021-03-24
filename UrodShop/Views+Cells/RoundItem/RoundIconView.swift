//
//  RoundIconView.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 24.03.2021.
//

import UIKit

final class RoundIconView: UIView {
    
    private var iconImage: UIImage?
    
    private let roundView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let iconImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    init(iconImage: UIImage? = nil) {
        self.iconImage = iconImage
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundViewVisualCorrection()
    }
    
    override func updateConstraints() {
        setRoundViewConstraints()
        setIconImageViewConstraints()
        super.updateConstraints()
    }
    
    
    func setImage(_ image: UIImage) {
        iconImage = image
        iconImageView.image = image
    }
    
    
    private func setupView() {
        setNeedsUpdateConstraints()
        setupRoundView()
        setupIconImageView()
    }
    
    private func setupRoundView() {
        roundView.backgroundColor = UIColor.white
        addSubview(roundView)
    }
    
    private func setupIconImageView() {
        iconImageView.image = iconImage
        roundView.addSubview(iconImageView)
    }
    
    private func roundViewVisualCorrection() {
        let cornerRadius = roundView.bounds.height / 2
        roundView.layer.cornerRadius = cornerRadius
        roundView.layer.shadowColor = UIColor.black.cgColor
        roundView.layer.shadowRadius = 10
        roundView.layer.shadowOffset = CGSize(width: 0, height: 2)
        roundView.layer.shadowOpacity = 0.1
    }
}

extension RoundIconView {
    private func setRoundViewConstraints() {
        NSLayoutConstraint.activate([
            roundView.topAnchor.constraint(equalTo: topAnchor),
            roundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            roundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            roundView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setIconImageViewConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: roundView.topAnchor, constant: 4),
            iconImageView.bottomAnchor.constraint(equalTo: roundView.bottomAnchor, constant: -4),
            iconImageView.leadingAnchor.constraint(equalTo: roundView.leadingAnchor, constant: 4),
            iconImageView.trailingAnchor.constraint(equalTo: roundView.trailingAnchor, constant: -4)
        ])
    }
}
