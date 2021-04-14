//
//  ABNavigationBar.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 14.04.2021.
//

import UIKit

final class ABNavigationBar: UIStackView {
    
    weak var delegate: ABNavigationBarDelegate?
    
    private let items: [ABNavigationBarItem]
    
    /// Пока нельзя устанавливать две кнопки на одной стороне NavigationBar
    init(items: [ABNavigationBarItem]) {
        self.items = items
        super.init(frame: .zero)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        guard let superview = superview else { return }
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: 4),
            heightAnchor.constraint(equalToConstant: Constants.NavigationBar.itemHeight),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -16)
        ])
        super.updateConstraints()
    }
    
    
    private func setupView() {
        setNeedsUpdateConstraints()
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        alignment = .center
        spacing = Constants.NavigationBar.spacing
        
        for item in items {
            let view = item.getView(delegate: self)
            addArrangedSubview(view)
            if item == .backItem {
                setCustomSpacing(
                    Constants.NavigationBar.spacing + (Constants.NavigationBar.itemWidth - Constants.NavigationBar.backItemWidth),
                    after: view
                )
            }
        }
        
    }
}


extension ABNavigationBar: ABNavigationBarDelegate {
    func backItemTapped() {
        delegate?.backItemTapped?()
    }
}
