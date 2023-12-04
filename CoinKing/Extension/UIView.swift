//
//  UIView.swift
//  CoinKing
//
//  Created by 홍정연 on 12/4/23.
//

import UIKit

// MARK: 원하는 부분만 radius가 들어가게 설정
extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )

        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
    }
}
