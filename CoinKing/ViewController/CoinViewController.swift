//
//  CoinViewController.swift
//  CoinKing
//
//  Created by 홍정연 on 12/1/23.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Kingfisher

class CoinViewController: UIViewController {
    
    let marketItem: Market
    var coinViewModel: CoinViewModel!
    private let disposeBag = DisposeBag()
    
    // MARK: 스크롤뷰
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    // MARK: 심볼이미지
    let symbolImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
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
        
        
        coinViewModel.coinDetails
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { coin in
                // 성공 시 처리
                self.bind(coin: coin)
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
        
        self.view.addSubview(scrollView)
        
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let contentView = UIView()
        scrollView.addSubview(contentView)
        
        
        contentView.snp.makeConstraints { make in
            make.edges.width.equalToSuperview()
            make.height.equalToSuperview().priority(.low)
        }
        
        contentView.addSubview(symbolImageView)
        
        symbolImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(24)
            make.height.width.equalTo(48)
        }
    }
    
    private func bind(coin: Coin) {
        
    }
}
