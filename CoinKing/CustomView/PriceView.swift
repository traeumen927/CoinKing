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
        return label
    }()
    
    
    // MARK: 증감분
    private let deltaPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = ThemeColor.tint1
        return label
    }()
    
    // MARK: 거래량
    private let volumeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = ThemeColor.tint2
        label.textAlignment = .right
        return label
    }()
    
    
    // MARK: 시초가
    private let firstPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = ThemeColor.tint2
        label.textAlignment = .right
        return label
    }()
    
    
    // MARK: 당일고가
    private let high24Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = ThemeColor.positive
        label.textAlignment = .right
        return label
    }()
    
    // MARK: 당일저가
    private let low24Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = ThemeColor.negative
        label.textAlignment = .right
        return label
    }()
    
    
    
    // MARK: 마지막 업데이트
    private let lastUpdateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = ThemeColor.tint2
        label.textAlignment = .right
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
        
        // MARK: 거래량 타이틀
        let titleVolumeLabel = UILabel.LabelFactory(text: "거래량(BTC)",
                                                    font: UIFont.systemFont(ofSize: 16, weight: .bold),
                                                    textColor: ThemeColor.tint1)
        
        // MARK: 시초가 타이틀
        let titleFirstPriceLabel = UILabel.LabelFactory(text: "시초가",
                                                    font: UIFont.systemFont(ofSize: 16, weight: .bold),
                                                    textColor: ThemeColor.tint1)
        
        // MARK: 당일고가 타이틀
        let titleHigh24Label = UILabel.LabelFactory(text: "당일고가",
                                                    font: UIFont.systemFont(ofSize: 16, weight: .bold),
                                                    textColor: ThemeColor.tint1)
        
        // MARK: 당일저가 타이틀
        let titleLow24Label = UILabel.LabelFactory(text: "당일저가",
                                                   font: UIFont.systemFont(ofSize: 16, weight: .bold),
                                                   textColor: ThemeColor.tint1)
        

        
        
        [currentPriceLabel, deltaPriceLabel, titleVolumeLabel, titleFirstPriceLabel, firstPriceLabel, volumeLabel, titleHigh24Label, high24Label, titleLow24Label, low24Label,  lastUpdateLabel].forEach(contentView.addSubview(_:))
        
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().inset(12)
        }
        
        
        currentPriceLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(12)
        }
        
        deltaPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(currentPriceLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(12)
        }
        
        titleVolumeLabel.snp.makeConstraints { make in
            make.top.equalTo(deltaPriceLabel.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(12)
        }
        
        volumeLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-12)
            make.centerY.equalTo(titleVolumeLabel.snp.centerY)
        }
        
        titleFirstPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleVolumeLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(12)
        }
        
        firstPriceLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-12)
            make.centerY.equalTo(titleFirstPriceLabel.snp.centerY)
        }
        
        titleHigh24Label.snp.makeConstraints { make in
            make.top.equalTo(titleFirstPriceLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(12)
        }
        
        high24Label.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-12)
            make.centerY.equalTo(titleHigh24Label.snp.centerY)
        }
        
        titleLow24Label.snp.makeConstraints { make in
            make.top.equalTo(titleHigh24Label.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(12)
        }
        
        low24Label.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-12)
            make.centerY.equalTo(titleLow24Label.snp.centerY)
        }
        
        lastUpdateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLow24Label.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
    
    func configure(with coin: Coin) {
        
        // MARK: 시초가 계산
        let firstPrice = coin.market_data.current_price.usd - coin.market_data.price_change_24h
        
        if coin.market_data.price_change_24h > 0 {
            currentPriceLabel.textColor = ThemeColor.positive
            deltaPriceLabel.textColor = ThemeColor.positive
        } else if coin.market_data.price_change_24h < 0 {
            currentPriceLabel.textColor = ThemeColor.negative
            deltaPriceLabel.textColor = ThemeColor.negative
        } else {
            currentPriceLabel.textColor = ThemeColor.stable
            deltaPriceLabel.textColor = ThemeColor.stable
        }
        
        
        self.currentPriceLabel.text = "$\(coin.market_data.current_price.usd.formattedStringWithCommaAndDecimal(places: 5))"
        
        self.deltaPriceLabel.text = "\(getUpDownSymbol(forChange: coin.market_data.price_change_24h)) $\(abs(coin.market_data.price_change_24h).roundedString(toDecimalPlaces: 5)) (\(coin.market_data.price_change_percentage_24h.roundedString(toDecimalPlaces: 2))%)"
        
        self.volumeLabel.text = "\(coin.market_data.total_volume.btc.formattedStringWithCommaAndDecimal(places: 0))"
        
        self.firstPriceLabel.text = "$\(firstPrice.formattedStringWithCommaAndDecimal(places: 5))"
        
        self.high24Label.text = "$\(coin.market_data.high_24h.usd.formattedStringWithCommaAndDecimal(places: 5)) (\(firstPrice.calculatePercentageChange(from: coin.market_data.high_24h.usd).roundedString(toDecimalPlaces: 3))%)"
        
        self.low24Label.text = "$\(coin.market_data.low_24h.usd.formattedStringWithCommaAndDecimal(places: 5)) (\(firstPrice.calculatePercentageChange(from: coin.market_data.low_24h.usd).roundedString(toDecimalPlaces: 3))%)"
        
        let formattedString = coin.market_data.last_updated.formattedDateString()
        self.lastUpdateLabel.text = formattedString == nil ? "최근 업데이트 정보 없음" : "최근 업데이트: \(formattedString!)"
    }
    
    func getUpDownSymbol(forChange change: Double) -> String {
        return change >= 0 ? "▲" : "▼"
    }
}
