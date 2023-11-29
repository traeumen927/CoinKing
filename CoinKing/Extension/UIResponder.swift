//
//  UIResponder.swift
//  CoinKing
//
//  Created by 홍정연 on 2023/09/26.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
