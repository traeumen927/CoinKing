//
//  CoinViewModel.swift
//  CoinKing
//
//  Created by 홍정연 on 12/1/23.
//

import Foundation

import Foundation
import RxSwift
import Alamofire

class CoinViewModel {
    private let coinID: String

    private let coinDetailsSubject = PublishSubject<Coin>()
        private let errorSubject = PublishSubject<Error>()

        var coinDetails: Observable<Coin> {
            return coinDetailsSubject.asObservable()
        }

        var error: Observable<Error> {
            return errorSubject.asObservable()
        }

    init(coinID: String) {
        self.coinID = coinID
    }

    func fetchCoinDetails() {
        ApiManager.request(.detailCoin(id: coinID), parameters: ["tickets": true, "market_data": true, "community_data": true, "developer_data": false, "sparkline": false]) { [weak self] (result: Result<Coin, AFError>) in
            
            switch result {
            case .success(let detailData):
                self?.coinDetailsSubject.onNext(detailData)
            case .failure(let error):
                self?.errorSubject.onNext(error)
            }
        }
    }
}
