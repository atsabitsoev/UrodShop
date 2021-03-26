//
//  SectionHeaderReusableView.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 26.03.2021.
//

import UIKit


class SectionHeaderReusableView: UICollectionReusableView {
  static var reuseIdentifier: String {
    return String(describing: SectionHeaderReusableView.self)
  }


    lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
    label.adjustsFontForContentSizeCategory = true
    label.textColor = .label
    label.textAlignment = .left
    label.numberOfLines = 1
    label.setContentCompressionResistancePriority(
      .defaultHigh,
      for: .horizontal)
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .systemBackground
    addSubview(titleLabel)

    NSLayoutConstraint.activate([
      titleLabel.leadingAnchor.constraint(
        equalTo: leadingAnchor),
      titleLabel.trailingAnchor.constraint(
        lessThanOrEqualTo: trailingAnchor)
    ])
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(
        equalTo: topAnchor,
        constant: 12),
      titleLabel.bottomAnchor.constraint(
        equalTo: bottomAnchor,
        constant: 0)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

