//
//  ABSegmentedControl.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 18.04.2021.
//

import UIKit

final class ABSegmentedControl: UIScrollView {
    
    var segmentedDelegate: ABSegmentedControlDelegate?
    
    private var items: [String]
    private var selectedIndex: Int?
    private var buttons: [ABSegmentButton] = []
    
    private let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = NSLayoutConstraint.Axis.horizontal
        $0.spacing = 24
        return $0
    }(UIStackView())
    
    
    init(items: [String] = [], selectedIndex: Int?) {
        self.items = items
        self.selectedIndex = selectedIndex
        super.init(frame: .zero)
        setupView()
        reloadItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setStackViewConstraints()
        super.updateConstraints()
    }
    
    
    private func setupView() {
        setNeedsUpdateConstraints()
        addSubview(stackView)
        showsHorizontalScrollIndicator = false
        clipsToBounds = false
    }
    
    private func reloadItems() {
        for item in items {
            let button = createItemButton(for: item, index: buttons.count)
            buttons.append(button)
            stackView.addArrangedSubview(button)
        }
        updateSelection()
    }
    
    private func updateSelection() {
        for (index, button) in buttons.enumerated() {
            button.setSelected(selectedIndex == index)
        }
    }
    
    private func createItemButton(for item: String, index: Int) -> ABSegmentButton {
        let button = ABSegmentButton()
        button.setTitle(item, for: .normal)
        button.setAction { [unowned self] in
            self.selectedIndex = index
            updateSelection()
            guard let segmentedDelegate = self.segmentedDelegate else { return }
            segmentedDelegate.indexSelected(index)
        }
        return button
    }
}


extension ABSegmentedControl {
    private func setStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: heightAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
