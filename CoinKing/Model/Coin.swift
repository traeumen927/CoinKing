//
//  Coin.swift
//  CoinKing
//
//  Created by 홍정연 on 12/1/23.
//

import Foundation

struct Coin: Decodable {
    //id
    let id: String
    //심볼
    let symbol: String
    //이름
    let name: String
    //발행주기(분)
    let block_time_in_minutes: Int
    
    //설명
    let description: Description
    
    //관련 링크
    let links: Links
    
    //이미지
    let image: Images
    
    //최초발행일
    let genesis_date: String?
    
    //오를거라 투표한 인원(%)
    let sentiment_votes_up_percentage: Double
    
    //내릴거라 투표한 인원(%)
    let sentiment_votes_down_percentage : Double
    
    //시장정보
    let market_data: Market_Data
}

struct Description: Decodable {
    //영어설명
    let en: String
    //한국어설명
    let ko: String
}

struct Links: Decodable {
    let homepage: [String]
    let blockchain_site: [String]
}

struct Images: Decodable {
    let thumb: String
    let small: String
    let large: String
}

struct Market_Data: Decodable {
    //현재가
    let current_price: CountryType
    //시가총액
    let market_cap: CountryType
    //24시간 최고가
    let high_24h: CountryType
    //24시간 최저가
    let low_24h: CountryType
    //거래량
    let total_volume:CoinType
    //총 발행한도
    let total_supply: Double
    //현재 유통량
    let circulating_supply: Double
    //증감액
    let price_change_24h: Double
    //증감율
    let price_change_percentage_24h: Double
    
    //마지막 업데이트(yyyy-MM-ddTHH:mm:ss.sssZ)
    let last_updated: String
}

struct CountryType: Decodable {
    let usd: Double
    let krw: Double
}

struct CoinType: Decodable {
    let btc: Double
    let eth: Double
}


struct Price: Decodable {
    let price: [Double]
}
