//
//  CounterView.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 19.04.2021.
//

import UIKit

final class CounterView: UIStackView {
    
    var delegate: CounterViewDelegate?
    
    private var value: Int
    private let maxValue: Int = 20
    private let minValue: Int = 0
    
    
    private let resultLabel: UILabel = {
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private let plusButton: UIButton = {
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(UIColor.accentColor, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 32)
        return $0
    }(UIButton(type: .system))
    
    private let minusButton: UIButton = {
        $0.setTitle("–", for: .normal)
        $0.setTitleColor(UIColor.accentColor, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 32)
        return $0
    }(UIButton(type: .system))
    
    
    init(startValue: Int = 0) {
        self.value = startValue
        super.init(frame: .zero)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        distribution = .fillEqually
        addArrangedSubview(plusButton)
        addArrangedSubview(resultLabel)
        addArrangedSubview(minusButton)
        
        updateValue()
        
        plusButton.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusTapped), for: .touchUpInside)
    }
    
    func setNewValue(_ value: Int) {
        if value > maxValue || value < minValue {
            fatalError("value is not correct")
        }
        self.value = value
        updateValue()
        valueChanged()
    }
    
    private func valueChanged() {
        delegate?.valueChanged(value)
    }
    
    private func updateValue() {
        resultLabel.text = "\(value) шт"
    }
    
    private func showButton(_ button: UIButton, show: Bool) {
        button.alpha = show ? 1 : 0.5
        button.isUserInteractionEnabled = show
    }
    
    
    @objc private func plusTapped() {
        setNewValue(value + 1)
        
        if value == maxValue {
            showButton(plusButton, show: false)
        } else if value == minValue + 1 {
            showButton(minusButton, show: true)
        }
    }
    
    @objc private func minusTapped() {
        setNewValue(value - 1)
        
        if value == minValue {
            showButton(minusButton, show: false)
        } else if value == maxValue - 1 {
            showButton(plusButton, show: true)
        }
    }
    
}
