//
//  ApiManager.swift
//  CoinKing
//
//  Created by 홍정연 on 11/29/23.
//

import Foundation
import Alamofire

struct ApiManager {
    static let baseURL = "https://api.coingecko.com/api/v3"
    
    static func request<T: Decodable>(_ endpoint: Endpoint, method: HTTPMethod = .get, parameters: Parameters? = nil, completion: @escaping (Result<T, AFError>) -> Void) {
        AF.request(endpoint.url, method: method, parameters: parameters, headers: endpoint.headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self) { response in
                completion(response.result)
            }
    }
    
    //for test
    static func requestJson<T: Decodable>(_ endpoint: Endpoint, method: HTTPMethod = .get, parameters: Parameters? = nil, completion: @escaping (Result<T, AFError>) -> Void) {
        AF.request(endpoint.url, method: method, parameters: parameters, headers: endpoint.headers)
            .validate(statusCode: 200..<300)
            .responseJSON { result in
                
            }
    }
}


extension ApiManager {
    enum Endpoint {
        case listCoins
        case detailCoin(id: String)
        
        var path: String {
            switch self {
            case .listCoins:
                return "/coins/markets"
            case .detailCoin(let id):
                return "/coins/\(id)"
            }
        }
        
        var url: String {
            return ApiManager.baseURL + self.path
        }
        
        var headers: HTTPHeaders {
            switch self {
            case .listCoins, .detailCoin:
                return ["accept": "application/json"]
            }
        }
    }
}

