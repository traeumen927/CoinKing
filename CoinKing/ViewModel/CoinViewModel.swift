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

    // Output
    private let coinDetailsSubject: PublishSubject<Result<Coin, AFError>> = PublishSubject()
    var coinDetails: Observable<Result<Coin, AFError>> {
        return coinDetailsSubject.asObservable()
    }

    private let errorSubject: PublishSubject<AFError> = PublishSubject()
    var error: Observable<AFError> {
        return errorSubject.asObservable()
    }

    init(coinID: String) {
        self.coinID = coinID
    }

    func fetchCoinDetails() {
        ApiManager.request(.detailCoin(id: coinID), parameters: ["tickets": true, "market_data": true, "community_data": true, "developer_data": false, "sparkline": false]) { [weak self] (result: Result<Coin, AFError>) in
            
            switch result {
            case .success(let detailData):
                self?.coinDetailsSubject.onNext(.success(detailData))
            case .failure(let error):
                self?.coinDetailsSubject.onNext(.failure(error))
                self?.errorSubject.onNext(error)
            }
        }
    }
}
