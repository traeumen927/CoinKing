//
//  MarketCell.swift
//  CoinKing
//
//  Created by 홍정연 on 11/29/23.
//

import UIKit
import SnapKit
import Kingfisher

class MarketCell: UITableViewCell {
    
    static let cellId = "MarketCell"
    
    // MARK: 코인 이미지
    let coinImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    // MARK: 코인명
    let coinNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = ThemeColor.tint1
        return label
    }()
    
    // MARK: 코인심볼
    let coinSymbolLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = ThemeColor.tint2
        return label
    }()
    
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.contentView.backgroundColor = ThemeColor.background
        contentView.addSubview(coinImage)
        contentView.addSubview(coinNameLabel)
        contentView.addSubview(coinSymbolLabel)
        
        
        coinImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.height.width.equalTo(30)
        }
        
        
        coinNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalTo(coinImage.snp.trailing).offset(12)
        }
        
        coinSymbolLabel.snp.makeConstraints { make in
            make.top.equalTo(coinNameLabel.snp.bottom).offset(4)
            make.leading.equalTo(coinImage.snp.trailing).offset(12)
            make.bottom.equalToSuperview().offset(-12)
        }
        
        
    }
    
    // MARK: - Configure Cell
    
    func configure(with coin: Coin) {
        // Customize this method based on the properties of your MarketData model
        coinNameLabel.text = coin.name
        coinSymbolLabel.text = coin.symbol
        
        if let url = URL(string: coin.image) {
            coinImage.kf.setImage(with: url)
        }
        
    }
}
