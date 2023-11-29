//
//  MarketViewController.swift
//  CoinKing
//
//  Created by 홍정연 on 11/29/23.
//

import UIKit
import Alamofire

class MarketViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiManager.request(.listCoins, parameters: ["vs_currency": "usd", "order": "market_cap_desc", "per_page": 100, "page": 1, "sparkline": false, "locale": "en"]) { (result: Result<[Coin], AFError>) in
            switch result {
            case .success(let marketData):
                print("Market Data Response Decodable: \(marketData)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

