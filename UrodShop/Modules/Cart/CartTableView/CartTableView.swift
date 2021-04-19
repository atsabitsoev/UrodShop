//
//  CartTableView.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 19.04.2021.
//

import UIKit

final class CartTableView: UITableView {
    
    struct Item {
        var image: UIImage
        var count: Int
        var title: String
        var subTitle: String
        var cost: String
    }
    
    
    private var items: [Item] = []
    
    
    init() {
        super.init(frame: .zero, style: .plain)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setItems(_ items: [Item]) {
        self.items = items
        reloadData()
    }
    
    
    private func setupView() {
        register(CartItemCell.self, forCellReuseIdentifier: CartItemCell.identifier)
        delegate = self
        dataSource = self
    }
}


extension CartTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartItemCell.identifier) as? CartItemCell else { return UITableViewCell() }
        let currentItem = items[indexPath.row]
        let viewModel = CartItemCell.ViewModel(
            image: currentItem.image,
            count: currentItem.count,
            title: currentItem.title,
            subTitle: currentItem.subTitle,
            cost: currentItem.cost)
        cell.configureCell(withModel: viewModel)
        return cell
    }
}
