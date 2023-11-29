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
}
