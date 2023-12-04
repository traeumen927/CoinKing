//
//  PriceView.swift
//  CoinKing
//
//  Created by 홍정연 on 12/4/23.
//

import UIKit

class PriceView: UIView {
    
    // MARK: 배경뷰
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColor.primary1
        view.layer.cornerRadius = 12
        return view
    }()
    
    // MARK: 현재가
    private let currentPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = ThemeColor.tint1
        label.text = "$4,333"
        return label
    }()
    
    
    // MARK: 증감분
    private let deltaPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = ThemeColor.tint1
        label.text = "3.31% ($32.21)"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layout()
    }
    
    private func layout() {
        self.addSubview(contentView)
        
        [currentPriceLabel, deltaPriceLabel].forEach(contentView.addSubview(_:))
        
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().inset(12)
        }
        
        
        currentPriceLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(12)
        }
        
        deltaPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(currentPriceLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
    
    private func configure(with coin: Coin) {
        
    }
}
