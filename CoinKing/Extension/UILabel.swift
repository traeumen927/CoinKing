//
//  UILabel.swift
//  CoinKing
//
//  Created by 홍정연 on 12/4/23.
//

import UIKit

extension UILabel {
    static func LabelFactory(text: String, font: UIFont, textColor: UIColor, textalign: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.textAlignment = textalign
        return label
    }
}
