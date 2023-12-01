//
//  CoinViewController.swift
//  CoinKing
//
//  Created by 홍정연 on 12/1/23.
//

import UIKit
import RxSwift
import RxCocoa

class CoinViewController: UIViewController {
    
    let marketItem: Market
    var coinViewModel: CoinViewModel!
    private let disposeBag = DisposeBag()
    
    init(item: Market) {
        self.marketItem = item
        super.init(nibName: nil, bundle: nil)
        self.coinViewModel = CoinViewModel(coinID: item.id)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        
        coinViewModel.fetchCoinDetails()
        
        
        // ViewModel에서 Coin Details 데이터를 RxSwift로 처리
        coinViewModel.coinDetails
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { result in
                switch result {
                case .success(let detailData):
                    // 성공 시 처리
                    print(detailData)
                case .failure(let error):
                    // 실패 시 처리
                    print(error)
                }
            })
            .disposed(by: disposeBag)
        
        // ViewModel에서 에러 처리를 RxSwift로 처리
        coinViewModel.error
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { error in
                // 실패 시 처리
                print(error)
            })
            .disposed(by: disposeBag)
    }
    
    private func layout() {
        self.title = self.marketItem.name
        self.view.backgroundColor = ThemeColor.background
    }
}
