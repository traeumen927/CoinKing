//
//  DescriptionView.swift
//  CoinKing
//
//  Created by 홍정연 on 12/4/23.
//

import UIKit

class DescriptionView: UIView {
    
    // MARK: 배경뷰
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColor.primary1
        view.layer.cornerRadius = 12
        return view
    }()
    
    // MARK: 개요
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = ThemeColor.tint1
        label.text = "개요"
        return label
    }()
    
    
    // MARK: 증감분
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = ThemeColor.tint1
        label.numberOfLines = 0
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
        
        [titleLabel, descriptionLabel].forEach(contentView.addSubview(_:))
        
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().inset(12)
        }
        
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(12)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
    
    func configure(with coin: Coin) {
        descriptionLabel.text = coin.description.ko
    }
}
