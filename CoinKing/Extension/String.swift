//
//  String.swift
//  CoinKing
//
//  Created by 홍정연 on 12/4/23.
//

import Foundation

extension String {
    func toDate(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }

    func formattedDateString(inputFormat: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ", outputFormat: String = "yyyy-MM-dd HH:mm:ss") -> String? {
        if let date = toDate(withFormat: inputFormat) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = outputFormat
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
