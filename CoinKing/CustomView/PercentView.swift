//
//  PercentView.swift
//  CoinKing
//
//  Created by 홍정연 on 11/29/23.
//

import UIKit
import SnapKit

class PercentView: UIView {
    private let percentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = ThemeColor.tint1
        label.textAlignment = .right
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        self.layer.cornerRadius = 6
        addSubview(percentLabel)
        percentLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().offset(-4)
            make.bottom.equalToSuperview().offset(-4)
            make.leading.greaterThanOrEqualToSuperview().offset(4)
        }
    }
    
    func setPercentage(_ percentage: Double) {
        percentLabel.text = "\(percentage.roundedString(toDecimalPlaces: 2))%"
        
        if percentage > 0 {
            // 빨간색 배경
            backgroundColor = ThemeColor.positive
        } else if percentage < 0 {
            // 파란색 배경
            backgroundColor = ThemeColor.negative
        } else {
            // 회색 배경
            backgroundColor = ThemeColor.stable
        }
    }
}
