//
//  MarketViewModel.swift
//  CoinKing
//
//  Created by 홍정연 on 11/29/23.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class MarketViewModel {
    private let disposeBag = DisposeBag()

    // Input
    let fetchDataTrigger = PublishSubject<Void>()

    // Output
    let coinDataSubject = PublishSubject<[Market]>()

    init() {
        
        fetchDataTrigger
            .subscribe { [weak self] _ in
                ApiManager.request(.listCoins, parameters: ["vs_currency": "usd", "order": "market_cap_desc", "per_page": 100, "page": 1, "sparkline": false, "locale": "en"]) { (result: Result<[Market], AFError>) in
                    switch result {
                    case .success(let coins):
                        self?.coinDataSubject.onNext(coins)
                    case .failure(let error):
                        self?.coinDataSubject.onError(error)
                    }
                }
            }
            .disposed(by: disposeBag)
    }
}
