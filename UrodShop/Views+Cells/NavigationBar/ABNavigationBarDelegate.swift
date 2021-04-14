//
//  ABNavigationBarDelegate.swift
//  UrodShop
//
//  Created by Ацамаз Бицоев on 14.04.2021.
//

import Foundation

@objc protocol ABNavigationBarDelegate: AnyObject {
    @objc optional func backItemTapped()
}
