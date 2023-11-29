//
//  Coin.swift
//  CoinKing
//
//  Created by 홍정연 on 11/29/23.
//

import Foundation

struct Coin: Decodable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let current_price: Double
    let high_24h: Double
    let low_24h: Double
    let price_change_percentage_24h: Double
}
