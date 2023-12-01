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
    
    //최초발행일
    let genesis_date: String
    
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

struct Market_Data: Decodable {
    //현재가
    let current_price: CountryDouble
    //시가총액
    let market_cap: CountryInt
    //24시간 최고가
    let high_24h: CountryDouble
    //24시간 최저가
    let low_24h: CountryDouble
    //총 발행한도
    let total_supply: Int
    //현재 유통량
    let circulating_supply: Int
    
    //마지막 업데이트(yyyy-MM-ddTHH:mm:ss.sssZ)
    let last_updated: String
}

struct CountryDouble: Decodable {
    let usd: Double
    let krw: Double
}

struct CountryInt: Decodable {
    let usd: Double
    let krw: Double
}

struct Price: Decodable {
    let price: [Double]
}
