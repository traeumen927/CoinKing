//
//  Double.swift
//  CoinKing
//
//  Created by 홍정연 on 11/29/23.
//

import Foundation

extension Double {
    // MARK: Double의 소수점 자릿수 제한
    func roundedString(toDecimalPlaces places: Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = places
        
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
    
    // MARK: 통화를 천의 자리마다 쉼표 표시 + 소수점 자릿수 제한
    func formattedStringWithCommaAndDecimal(places: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = places
        
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
    
    // MARK: 증감율 계산
    func calculatePercentageChange(from value: Double) -> Double {
        guard value != 0 else {
            return 0 // 예외 처리: 분모가 0이면 0을 반환하여 나누기 오류를 방지
        }
        
        return ((value - self) / self) * 100
    }
}
